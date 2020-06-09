class CreateSeatGroups < ActiveRecord::Migration[5.2]
  def up
    create_table :seat_groups do |t|
      t.references :member, foreign_key: true
      t.string :name

      t.timestamps
    end
    remove_column :members,:booking_group
    add_column :members,:seat_group_id,:integer
    add_column :seat_groups,:password,:string,default: nil

  end
  def down
    drop_table :seat_groups
    add_column :members,:booking_group,:string
    remove_column :members,:seat_group_id
    remove_column :members,:password
  end
end
