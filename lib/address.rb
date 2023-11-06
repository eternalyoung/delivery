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
    errors = []
    errors << "No city data" unless @city
    errors << "No street data" unless @street
    errors << "No house data" unless @house

    {result: errors.empty?, errors:}
  end
end
