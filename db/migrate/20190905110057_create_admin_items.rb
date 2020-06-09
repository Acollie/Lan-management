class CreateAdminItems < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_items do |t|
      t.string :name
      t.float :price
      t.integer :location,default: 0

      t.timestamps
    end
  end
end
