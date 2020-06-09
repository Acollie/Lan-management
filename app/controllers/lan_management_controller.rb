class LanManagementController < ApplicationController
  before_action :committee_auth

  def index
    @lan = Lan.where('start_date > ?', Time.zone.now).order(start_date: :asc).limit(1).first
    @ticket = Attendee.new
    #TODO create new ticket and transfer ticket payment
    # TODO Fix so if they are paid it says

  end
  def activate_ticket
    Attendee.find(params[:format]).item_order.update(ticket_activated:true)
    redirect_to lan_management_index_path
  end
  def add_ticket
    item = Admin::Item.find(params[:format])
    order= Order.create(member:Member.first)
    order.item_orders.create(admin_item:item,price:item.price,quantity:1,ticket_activated:true)
    redirect_to lan_management_index_path
  end
end
