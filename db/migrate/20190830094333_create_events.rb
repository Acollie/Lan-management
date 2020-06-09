class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :lan, foreign_key: true
      t.string :name
      t.datetime :at
      t.integer :member_id
      t.boolean :is_competition, default: false

      t.timestamps
    end
  end
end
