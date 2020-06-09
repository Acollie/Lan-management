class ItemOrder < ApplicationRecord
  belongs_to :order
  belongs_to :admin_item,:class_name => 'Admin::Item'
  belongs_to :member,optional:true
  has_one :attendee
  before_create :set_lan_ticket
  before_create :create_attendee
  private

  def create_attendee
    if self.admin_item.lan_ticket
      t = Attendee.new
      t.lan = self.admin_item.lan
      t.ticket_type = self.admin_item.lan_ticket_type
      t.member = self.order.member
      t.paid = self.order.paid
      t.item_order = self

    end
  end

  def set_lan_ticket
    if self.admin_item.lan_ticket
      self.ticket_activated ||= false
    end
  end
end
