require 'congress'
require 'uri'
require 'hashie/mash'

class ApplicationController < ActionController::Base
  protect_from_forgery
  # attr_accessible :email, :firstname, :lastname, :congress_office, :facebook_id, :twitter_id

  def congresspeople(coords)
    client = Congress::Client.new('d0bf729df6784c0ba12028a78949ce73')
    data_congress = client.legislators_locate(coords.lat, coords.lng)
    senior_senator = data_congress.results.select {|item| "senior" == item.state_rank}.first
    junior_senator = data_congress.results.select {|item| "junior" == item.state_rank}.first
    representative = data_congress.results.select {|item| "house" == item.chamber}.first

    # data senior senator
    new_senior_senator = Hash.new
    new_senior_senator[:email]          = senior_senator.oc_email
    new_senior_senator[:firstname]      = senior_senator.first_name
    new_senior_senator[:lastname]       = senior_senator.last_name
    new_senior_senator[:congress_office]= senior_senator.office
    new_senior_senator[:facebook_id]    = senior_senator.facebook_id
    new_senior_senator[:twitter_id]     = senior_senator.twitter_id
    # end data senior senator

    # data junior senator
    new_junior_senator = Hash.new
    new_junior_senator[:email]          = junior_senator.oc_email
    new_junior_senator[:firstname]      = junior_senator.first_name
    new_junior_senator[:lastname]       = junior_senator.last_name
    new_junior_senator[:congress_office]= junior_senator.office
    new_junior_senator[:facebook_id]    = junior_senator.facebook_id
    new_junior_senator[:twitter_id]     = junior_senator.twitter_id
    # end data junior senator

    # data representative
    new_representative = Hash.new
    new_representative[:email]          = representative.oc_email
    new_representative[:firstname]      = representative.first_name
    new_representative[:lastname]       = representative.last_name
    new_representative[:congress_office]= representative.office
    new_representative[:facebook_id]    = representative.facebook_id
    new_representative[:twitter_id]     = representative.twitter_id
    # end data representative

    new_data_congress = Hash.new
    new_data_congress[:senior_senator] = Hashie::Mash.new(new_senior_senator)
    new_data_congress[:junior_senator] = Hashie::Mash.new(new_junior_senator)
    new_data_congress[:representative] = Hashie::Mash.new(new_representative)

    return new_data_congress
  end

  def get_recipient_list address
		# response = RestClient::Request.execute(method: :get, url: 'https://www.googleapis.com/civicinfo/v2/representatives?key=AIzaSyDD8OUS69XKjX-hAk9QC6aeI5oMkVY9d8o&address=1263%20Pacific%20Ave.%20alaska%20City%20AK', timeout: 10)
    address = URI.encode(address)
    response = RestClient::Request.execute(method: :get, url: "https://www.googleapis.com/civicinfo/v2/representatives?key=AIzaSyDD8OUS69XKjX-hAk9QC6aeI5oMkVY9d8o&address=#{address}&includeOffices=true&roles=legislatorUpperBody&roles=legislatorLowerBody", timeout: 10)
		result = JSON.parse(response.body)
      senior_senator = result["officials"][0]
      junior_senator = result["officials"][1]
      representative = result["officials"][2]

      # data senior senator
      new_senior_senator = Hash.new

      new_senior_senator[:name]           = senior_senator["name"]
      new_senior_senator[:congress_office]= senior_senator["address"]
      new_senior_senator[:facebook_id]    = senior_senator["channels"].select{|a| a["id"] if a["type"] == "Facebook" }.first["id"]
      new_senior_senator[:twitter_id]     = senior_senator["channels"].select{|a| a["id"] if a["type"] == "Twitter" }.first["id"]

      # end data senior senator

      # data junior senator
      new_junior_senator = Hash.new
      new_junior_senator[:name]      = junior_senator["name"] rescue nil
      new_junior_senator[:congress_office]= junior_senator["address"] rescue nil
      new_junior_senator[:facebook_id]    = junior_senator["channels"].select{|a| a["id"] if a["type"] == "Facebook" }.first["id"] rescue nil
      new_junior_senator[:twitter_id]     = junior_senator["channels"].select{|a| a["id"] if a["type"] == "Twitter" }.first["id"]  rescue nil
      # end data junior senator 

      # data representative
      new_representative = Hash.new
      new_representative[:name]      = representative["name"] rescue nil
      new_representative[:congress_office]= representative["address"] rescue nil
      new_representative[:facebook_id]    = representative["channels"].select{|a| a["id"] if a["type"] == "Facebook" }.first["id"] rescue nil
      new_representative[:twitter_id]     = representative["channels"].select{|a| a["id"] if a["type"] == "Twitter" }.first["id"] rescue nil
      # end data representative

      new_data_congress = Hash.new
      new_data_congress[:senior_senator] = Hashie::Mash.new(new_senior_senator) rescue nil
      new_data_congress[:junior_senator] = Hashie::Mash.new(new_junior_senator) rescue nil
      new_data_congress[:representative] = Hashie::Mash.new(new_representative) rescue nil

		return new_data_congress
  end
end
