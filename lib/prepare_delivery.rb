TRUCKS = { kamaz: 3000, gazel: 1000 }

class PrepareDelivery
  class DeliveryError < StandardError; end
  class Outdated < DeliveryError; end
  class NoAddress < DeliveryError; end
  class NoCar < DeliveryError; end

  def initialize(order)
    @order = order 
  end

  def perform(destination_address, delivery_date)
    validate_delivery_date!(delivery_date)
    validate_address!(destination_address)

    weight = @order.total_weight
    truck = truck_selector!(weight)

    {
      truck:,
      weight:,
      order_number: @order.id,
      address: destination_address.to_s,
      status: :ok
    }

  rescue DeliveryError => e
    {
      status: :error,
      error_message: e.message
    }
  end

  private

  def validate_delivery_date!(delivery_date)
    raise Outdated, "Дата доставки уже прошла" if delivery_date < DateTime.now
  end

  def validate_address!(destination_address)
    raise NoAddress, "Нет адреса" unless destination_address.is_full?
  end

  def truck_selector!(weight)
    truck = TRUCKS.keys.find { TRUCKS[_1] > weight }
    raise NoCar, "Нет подходящей машины" unless truck
    truck
  end
end
