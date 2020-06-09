class CreateLans < ActiveRecord::Migration[5.2]
  def change
    create_table :lans do |t|
      t.string :name, null: false, default: 'untitled lan'
      t.text :about
      t.string :location, default: 'Earth'
      t.datetime :date, default: Time.now

      t.timestamps
    end
  end
end
