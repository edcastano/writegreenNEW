class Letter 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :name, :street_address, :city, :state, :zipcode
  
  validates_presence_of :name, :street_address, :city, :state, :zipcode
  
  def initialize(attributes = {})
   attributes.each do |name, value|
     send("#{name}=", value)
	 end
	end
	
	def persisted?
	 false
	end

end
