class CreateItemOrders < ActiveRecord::Migration[5.2]
  def up
    create_table :item_orders do |t|
      t.integer :order_id
      t.integer :admin_item_id
      # t.references :orders, foreign_key: true
      # t.references :admin_items, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
    remove_column :orders,:price
    remove_column :orders,:quantity
    remove_column :orders,:ticket_activated
    remove_column :orders,:admin_item_id

    add_column :item_orders,:ticket_activated,:boolean

  end
  def down
    drop_table :item_orders
    add_column :orders,:price,:float
    add_column :orders,:quantity,:integer,default: 1
    add_column :orders,:ticket_activated,:boolean
    add_column :orders,:admin_item_id,:integer


  end
end
