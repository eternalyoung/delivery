class Order
  attr_accessor :id, :products

  def initialize(id, products = [])
    @id = id
    @products = products
  end

  def add_product(product)
    @products << product
  end

  def total_weight
    @products.sum(&:weight)
  end
end
