class Admin::Item < ApplicationRecord
  belongs_to :lan,optional: true
  belongs_to :item_order,optional:true

end
