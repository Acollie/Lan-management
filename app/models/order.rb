class Order < ApplicationRecord
  belongs_to :member
  has_many :item_orders
  has_many :admin_items, :class_name => 'Admin::Item'

end
