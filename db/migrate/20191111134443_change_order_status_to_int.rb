class ChangeOrderStatusToInt < ActiveRecord::Migration[5.2]
  def up
    change_column :orders,:paid,:integer,default: 0
  end
  def down
    change_column :orders,:paid,:boolean,default: 0

  end
end
