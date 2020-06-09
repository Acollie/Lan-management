class StatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_items, :available,:boolean,default: true
  end
end
