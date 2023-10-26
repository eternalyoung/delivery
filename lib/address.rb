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

  def is_full?
    !(city.empty? || street.empty? || house.empty?)
  end
end
