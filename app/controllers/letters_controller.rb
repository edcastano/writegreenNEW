require 'geokit'
include Geokit::Geocoders

class LettersController < ApplicationController

  def show
  @share_url = "http://writegreen.herokuapp.com/"
  @step = 2  #Used to set styling (color) for step buttons
  @name = params[:name]
  @street_address = params[:street_address]
  @city = params[:city]
  @state = params[:state]
  @zipcode = params[:zipcode]
  @address = @street_address + ' ' + @city + ", " + @state + ' ' + @zipcode
  @emphasis = params[:emphasis]
  if @emphasis != nil
    @emphasis = params[:emphasis]
    @political_ideology = params[:ideology]
    @religion = params[:religion]
    @ideologyKey = @political_ideology + @religion
    @geography = params[:geography]
    @recipient = params[:recipient]
  else
    @recipient_lastname = " not_selected"
  end
  @data = get_recipient_list @address
  @senior_senator = @data[:senior_senator]
  @junior_senator = @data[:junior_senator]
  @representative = @data[:representative]

  @sen_senator_title = 'Senator '+@data[:senior_senator].name
  @jun_senator_title = 'Senator '+@data[:junior_senator].name
  @rep_title = 'Representative '+@data[:representative].name rescue nil

  # coords = MultiGeocoder.geocode(@address)
  # @senior_senator = congresspeople(coords)[:senior_senator]
  # @junior_senator = congresspeople(coords)[:junior_senator]
  # @representative = congresspeople(coords)[:representative]
 #  # sunlight code
  # # @congresspeople = Sunlight::Legislator.all_for(:latitude => coords.lat, :longitude => coords.lng)
 #  # @senior_senator = @congresspeople[:senior_senator]
  # # @junior_senator = @congresspeople[:junior_senator]
  # # @representative = @congresspeople[:representative]
 #  # end sunlight code

  # @senior_senatorEmail = @senior_senator.email
  # @junior_senatorEmail = @junior_senator.email
  # @representativeEmail = @representative.email

 #  @sen_senator_title = 'Senator '+@senior_senator.firstname + " " + @senior_senator.lastname
  # @jun_senator_title = 'Senator '+@junior_senator.firstname + " " + @junior_senator.lastname
  # @rep_title = 'Representative '+@representative.firstname + " " + @representative.lastname

  # @sen_senator_address = @senior_senator.congress_office
  # @jun_senator_address = @junior_senator.congress_office
  # @rep_address = @representative.congress_office

  # @sen_senator_title_lastname = 'Senator' + ' ' + @senior_senator.lastname
  # @jun_senator_title_lastname = 'Senator' + ' ' + @junior_senator.lastname
  # @rep_title_lastname = 'Representative' + ' ' + @representative.lastname

  # @sen_senator_name = @senior_senator.firstname + " " + @senior_senator.lastname
  # @jun_senator_name = @junior_senator.firstname + " " + @junior_senator.lastname
  # @rep_name = @representative.firstname + " " + @representative.lastname

  # @rep_address = Hash[[[@sen_senator_title, @sen_senator_address], [@jun_senator_title, @jun_senator_address], [@rep_title, @rep_address]]]
  # @rep_lastname = Hash[[[@sen_senator_title, @sen_senator_title_lastname], [@jun_senator_title, @jun_senator_title_lastname], [@rep_title, @rep_title_lastname]]]
  # @rep_name = Hash[[[@sen_senator_title, @sen_senator_name], [@jun_senator_title, @jun_senator_name], [@rep_title, @rep_name]]]
  #    if @rep_address[@recipient] != nil
  #    @recipient_address = @rep_address[@recipient]
  #    @recipient_lastname = @rep_lastname[@recipient]
  #    @recipient_name = @rep_name[@recipient]
  #    end

  # render :file => "/letters/show.json", :content_type => 'application/json'
  respond_to do |format|
    format.json
  end

  end

  def edit
  @step = 3  #Used to set styling (color) for step buttons
  @name = params[:name]
  @street_address = params[:street_address]
  @city = params[:city]
  @state = params[:state]
  @zipcode = params[:zipcode]
  @address = @street_address + ' ' + @city + ", " + @state + ' ' + @zipcode

  @emphasis = params[:emphasis]
  if @emphasis != nil
    @emphasis = params[:emphasis]
    @political_ideology = params[:ideology]
    @religion = params[:religion]
    @ideologyKey = @political_ideology + @religion
    @geography = params[:geography]
    @recipient = params[:recipient]
  else
    @recipient_lastname = " not_selected"
  end

  @data = get_recipient_list @address
  @senior_senator = @data[:senior_senator]
  @junior_senator = @data[:junior_senator]
  @representative = @data[:representative]

  @sen_senator_title = 'Senator '+@data[:senior_senator].name
  @jun_senator_title = 'Senator '+@data[:junior_senator].name
  @rep_title = 'Representative '+@data[:representative].name rescue nil

  @rep_address = @representative.congress_office
  @jun_senator_address = @junior_senator.congress_office
  @sen_senator_address = @senior_senator.congress_office
  @rep_name = @representative.name

  @rep_address = Hash[[[@sen_senator_title, @sen_senator_address], [@jun_senator_title, @jun_senator_address], [@rep_title, @rep_address]]]

  if @rep_address[@recipient] != nil
    @recipient_address = @rep_address[@recipient]
    @recipient_lastname = @recipient
    @recipient_name = @recipient
  end

  if(!@share)
    @share  = Share.create!();
  end
    @share_url = "http://writegreen.org/shares/#{@share.id}"

  # coords = MultiGeocoder.geocode(@address)
  # @senior_senator = congresspeople(coords)[:senior_senator]
  # @junior_senator = congresspeople(coords)[:junior_senator]
  # @representative = congresspeople(coords)[:representative]

  # sunlight code
  # @congresspeople = Sunlight::Legislator.all_for(:latitude => coords.lat, :longitude => coords.lng)
  # @senior_senator = @congresspeople[:senior_senator]
  # @junior_senator = @congresspeople[:junior_senator]
  # @representative = @congresspeople[:representative]
  # end sunlight code

  # @sen_senator_title = 'Senator '+@senior_senator.firstname + " " + @senior_senator.lastname
  # @jun_senator_title = 'Senator '+@junior_senator.firstname + " " + @junior_senator.lastname
  # @rep_title = 'Representative '+@representative.firstname + " " + @representative.lastname

  # @sen_senator_address = @senior_senator.congress_office
  # @jun_senator_address = @junior_senator.congress_office
  # @rep_address = @representative.congress_office

  # @sen_senator_title_lastname = 'Senator' + ' ' + @senior_senator.lastname
  # @jun_senator_title_lastname = 'Senator' + ' ' + @junior_senator.lastname
  # @rep_title_lastname = 'Representative' + ' ' + @representative.lastname

  # @sen_senator_name = @senior_senator.firstname + " " + @senior_senator.lastname
  # @jun_senator_name = @junior_senator.firstname + " " + @junior_senator.lastname

  # @rep_name = @representative.firstname + " " + @representative.lastname

  # @rep_address = Hash[[[@sen_senator_title, @sen_senator_address], [@jun_senator_title, @jun_senator_address], [@rep_title, @rep_address]]]
  # @rep_lastname = Hash[[[@sen_senator_title, @sen_senator_title_lastname], [@jun_senator_title, @jun_senator_title_lastname], [@rep_title, @rep_title_lastname]]]
  # @rep_name = Hash[[[@sen_senator_title, @sen_senator_name], [@jun_senator_title, @jun_senator_name], [@rep_title, @rep_name]]]

  
  end

  def new
    @step = 1 #Used to set styling (color) for step buttons
  end


  def create
    @letter = Letter.new(params[:letter])
      if @letter.valid?
        format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
end