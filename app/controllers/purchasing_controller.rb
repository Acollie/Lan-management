class PurchasingController < ApplicationController
  before_action :member_auth

  def index
    @items = Admin::Item.all
  end
  def success

  end
  def checkout
    @order= current_member.orders.last
  end
  def order_create
    puts params
    order = current_member.orders.create
    total_price = 0
    params[:data_values].each do |key,array|
      item = Admin::Item.find_by(name: array[:name])
      transaction = order.item_orders.new
      transaction.admin_item=item
      transaction.price=item.price
      total_price+=(item.price*(array[:quantity].to_f))
      transaction.quantity=array[:quantity]
      transaction.save
    end
    order.total_price = total_price
    order.save
  end

  def payment

    current_member.orders.last.update(paid:true)
    redirect_to purchasing_success_path
  end
  def orders
    @orders= Order.all.order("created_at")
  end
  def paid
    Order.find(params[:format]).update(paid:true)
    redirect_to purchasing_orders_path
  end

  def show
    @item = Admin::Item.find(params[:format])
  end
end
