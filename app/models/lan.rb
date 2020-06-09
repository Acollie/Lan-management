class Lan < ApplicationRecord
  has_many :attendees
  has_many :members,through: :attendees
  has_many :events
  has_many :admin_items, :class_name => 'Admin::Item'

  after_create :create_ticket
  after_update :price_update
  validate :date_validator

  private

  def date_validator
    if self.end_date.past?
      errors.add(:end_date,"End date cannot be in the past")
    end
    if self.start_date.past?
      errors.add(:start_date,"Start date cannot be in the past")
    end
    if self.end_date < self.start_date
      errors.add(:add_date,"End Date must be after start date")
    end

  end


  def create_ticket
    Admin::Item.create(lan:Lan.find(self.id),name: "Lan #{ self.id } ticket member", price: self.tickets_price_member,lan_ticket:true,lan_ticket_type:1)
    Admin::Item.create(lan:Lan.find(self.id),name: "Lan #{ self.id } ticket non member", price: self.ticket_price_non_member,lan_ticket:true,lan_ticket_type:2)
    Admin::Item.create(lan:Lan.find(self.id),name: "Lan #{ self.id } ticket visitor", price: self.ticket_price_visitor,lan_ticket:true,lan_ticket_type:3)


  end
  def price_update
    Admin::Item.where(lan:Lan.find(self.id),lan_ticket:true,lan_ticket_type:1).update(price:self.tickets_price_member,available:self.tickets_available)
    Admin::Item.where(lan:Lan.find(self.id),lan_ticket:true,lan_ticket_type:2).update(price:self.ticket_price_non_member,available:self.tickets_available)
    Admin::Item.where(lan:Lan.find(self.id),lan_ticket:true,lan_ticket_type:3).update(price:self.ticket_price_visitor,available:self.tickets_available)
  end
end
