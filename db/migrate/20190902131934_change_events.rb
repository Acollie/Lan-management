class ChangeEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events,:at,:start_time
  end
end
