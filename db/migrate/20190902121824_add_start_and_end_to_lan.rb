class AddStartAndEndToLan < ActiveRecord::Migration[5.2]
  def change
    remove_column :lans,:date
    add_column :lans,:start_date,:datetime,default: Time.now
    add_column :lans,:end_date,:datetime,default: Time.now+2.days
  end
end
