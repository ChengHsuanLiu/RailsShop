class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart_items.includes(:variant)
  end

  def create
    # 先找到商品
    @variant = Variant.find_by_id(params[:cart_item][:variant_id])
    raise 'error' if @variant.nil?

    # 檢查是否購物車已經有，如果有就更新數量、沒有就創造新的
    @cart_item = current_user.cart_items.find_by_variant_id(params[:cart_item][:variant_id])
    if @cart_item.present? # update cart item
      @cart_item.quantity += params[:cart_item][:quantity].to_i
    else # create new one
      @cart_item = current_user.cart_items.new
      @cart_item.quantity = params[:cart_item][:quantity].to_i
    end

    # 更新商品數據
    @cart_item.shop_id = @variant.product.shop_id
    @cart_item.variant_id = @variant.id
    @cart_item.price = @variant.price
    @cart_item.unit_name = @variant.unit_name

    # 儲存
    if @cart_item.save
      flash[:success] = 'Add to cart.'
      redirect_to product_path(@variant.product)
    else
      flash[:success] = @cart_item.erros.full_messages
      redirect_to product_path(@variant.product)
    end
  end

  def destroy
    @cart_item = current_user.cart_items.find_by_id(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
end
