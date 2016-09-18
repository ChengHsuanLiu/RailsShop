class ProductsController < ApplicationController
  def index
    # TODO : pagination , filter, search
    @products = Product.all
  end

  def show
    @product = Product.find_by_id(params[:id])
    @cart_item = CartItem.new
    if @product.nil?
      flash[:error] = '此商品不存在'
      redirect_to products_path
    end
  end
end
