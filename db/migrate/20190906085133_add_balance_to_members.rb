class AddBalanceToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members,:balance,:float,default: 0.0
  end
end
