class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.float :amount
      t.references :event, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
