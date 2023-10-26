require_relative"lib/address.rb"
require_relative"lib/oder.rb"
require_relative"lib/prepare_delivery.rb"

PrepareDelivery.new(Order.new, OpenStruct.new).perform(Address.new, Date.tomorrow)
