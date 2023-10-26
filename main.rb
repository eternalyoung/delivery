require_relative"lib/address.rb"
require_relative"lib/oder.rb"
require_relative"lib/prepare_delivery.rb"

address = Address.new("Ростов-на-Дону", "ул. Маршала Конюхова", "д. 5")
order = Order.new("id")
order.add_product(OpenStruct.new(weight: 20))
order.add_product(OpenStruct.new(weight: 40))

PrepareDelivery.new(order).perform(address, Date.tomorrow)
