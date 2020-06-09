class AddMoreUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :members,:emergency_contact_name,:string,default: ''
    add_column :members, :emergency_phone_number,:string,default: ''
    add_column :members, :booking_group,:text,default: nil
    add_column :members,:paid_membership,:boolean,default: false
    add_column :members, :lan_van_phone_number,:string
    add_column :members,:lan_van_address,:text
    add_column :members,:lan_van_post_code,:string
    add_column :members,:lan_van_collection_required,:boolean,default: false
    add_column :members,:lan_van_dropoff_required,:boolean,default: false
    add_column :members, :lan_van_availability,:text
  end
end
