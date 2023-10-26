class Address
  attr_accessor :city, :street, :house

  def initialize(city, street, house)
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "#{@city}, ул. #{@street}, д. #{@house}"
  end
end
