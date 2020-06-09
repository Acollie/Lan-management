class AddAttendeeToItemOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :item_orders,:attendee_id,:integer
    add_column :attendees,:item_order_id,:integer
  end
end
