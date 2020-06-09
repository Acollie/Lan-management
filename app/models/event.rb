class Event < ApplicationRecord
  belongs_to :lan
  has_one :member
  has_many :scores
end
