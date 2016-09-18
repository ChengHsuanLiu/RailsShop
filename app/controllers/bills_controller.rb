class BillsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bills = current_user.bills.includes(:orders)
  end

  def show
    @bill = current_user.bills.find_by_id(params[:id])
    if @bill.present?
      @orders = @bill.orders
    else
      flash[:error] = '這筆訂單不存在或是你沒有權限查看'
      redirect_to bills_path
    end
  end

  def new
    @cart_items = current_user.cart_items.includes(:varient)
    @bill = current_user.bills.new
  end

  def create
    # log errors
    error_message = ""

    begin
      ActiveRecord::Base.transaction do
        # TODO: 檢查庫存
        bill_total = 0
        @bill = current_user.bills.new(bill_params)
        @cart_items = current_user.cart_items

        # 每個商店不同訂單
        @cart_items.pluck(:shop_id).uniq.each do |shop_id|
          @order = @bill.orders.new({
            user_id: current_user.id,
            shop_id: shop_id,
            bill_name: @bill.bill_name,
            bill_address: @bill.bill_address,
            bill_phone: @bill.bill_phone,
          })

          # calculate order total
          total = 0
          @cart_items.where(shop_id: shop_id).each do |item|
            @order.line_items.new({
              varient_id: item.varient_id,
              price: item.price,
              quantity: item.quantity,
              product_name: item.varient.product.name,
              varient_name: item.varient.name,
              unit_name: item.unit_name,
             })
            total += (item.price * item.quantity)
          end
          bill_total += total
          @order.total = total
        end

        @bill.total = bill_total
        if @bill.save
          redirect_to bill_path(@bill)
        else
          error_message = @bill.errors.full_messages
        end
      end
    rescue Exception => e
      flash['error'] = e + error_message
      render 'new'
    end
  end

  private
  def bill_params
    params.require(:bill).permit(:payment_type, :bill_name, :bill_address, :bill_phone)
  end
end
