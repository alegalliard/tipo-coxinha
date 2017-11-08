class ProductsController < ApplicationController
  def new
    @product = Product.new
    @category = Category.all
    @delivery_type = DeliveryType.all
    @unity = Unity.all
  end
end
