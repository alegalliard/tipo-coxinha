class ProductsController < ApplicationController

  before_action :find_product, only: [:show]

  def show; end

  def new
    @product = Product.new
    set_attributes
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path @product
    else
      set_attributes
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :category_id, :delivery_type_id,
                                    :unity_id, :price)
  end

  def set_attributes
    @category = Category.all
    @delivery_type = DeliveryType.all
    @unity = Unity.all
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
