class AddStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders,:paid,:boolean,default: false
    add_column :orders,:total_price,:float,default: 0
  end
end
