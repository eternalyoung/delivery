class PrepareDelivery
  TRUCKS = { kamaz: 3000, gazel: 1000 }

  def initialize(order)
    @order = order 
  end

  def perform(destination_address, delivery_date)
    result = { truck: nil, weight: nil, order_number: @order.id, address: destination_address, status: :ok }
    raise "Дата доставки уже прошла" if delivery_date < Time.current
    raise "Нет адреса" if destination_address.city.empty? || destination_address.street.empty? || destination_address.house.empty?

    weight = @order.products.map(&:weight).sum
    TRUCKS.keys.each { |key| result[:truck] = key if TRUCKS[key.to_sym] > weight }
    raise "Нет машины" if result[:truck].nil?

    result
   rescue StandardError
     result[:satus] = "error"
  end
end
