class Score < ApplicationRecord
  belongs_to :event
  belongs_to :member
end
