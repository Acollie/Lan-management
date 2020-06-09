class Attendee < ApplicationRecord
  belongs_to :lan
  belongs_to :member
  belongs_to :item_order
end
