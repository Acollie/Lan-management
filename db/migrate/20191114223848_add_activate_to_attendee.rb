class AddActivateToAttendee < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees,:ticket_activation,:boolean,default: false
    add_column :attendees,:ticket_type,:integer
    add_column :attendees,:paid,:boolean
  end
end
