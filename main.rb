require_relative"lib/address.rb"
require_relative"lib/oder.rb"
require_relative"lib/prepare_delivery.rb"

address = Address.new("Ростов-на-Дону", "ул. Маршала Конюхова", "д. 5")
PrepareDelivery.new(Order.new, OpenStruct.new).perform(address, Date.tomorrow)
