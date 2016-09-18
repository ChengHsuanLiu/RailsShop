class Admins::OrdersController < Admins::BaseController
  def index
    @orders = @shop.orders
  end

  def show
    @orders = @shop.orders.find_by_id(params[:id])
  end

  def edit
    @orders = @shop.orders.find_by_id(params[:id])
  end

  def update
    @orders = @shop.orders.find_by_id(params[:id])
    @orders.update(order_params)
  end

  private
  def order_params
    params.require(:order).permit(:state, :bill_name, :bill_address, :bill_phone, :shipping_name, :shipping_address, :shipping_phone, :company_name, :company_registration_number)
  end
end
