class AddExtraDataToLans < ActiveRecord::Migration[5.2]
  def change
    add_column :lans,:tickets_available,:integer,default: 100
    add_column :lans, :tickets_available_member,:boolean,default: false
    add_column :lans,:tickets_sold_out_member,:boolean,default: false
    add_column :lans,:tickets_price_member,:float,default: 10
    add_column :lans, :ticket_price_non_member,:float,default: 16
    add_column :lans, :ticket_sold_out_non_member,:boolean,default: false
    add_column :lans,:ticket_price_visitor,:float,default: 5
    add_column :lans, :ticket_available_date,:datetime,default: Time.now
    add_column :lans, :charity_lan,:boolean,default: false

    add_column :admin_items,:lan_id,:integer
    add_column :admin_items,:lan_ticket,:boolean,default: false
    add_column :admin_items, :lan_ticket_type,:integer,default: 0
    add_column :orders,:ticket_activated,:boolean,default: false
  end
end
