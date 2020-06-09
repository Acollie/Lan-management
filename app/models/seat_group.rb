class SeatGroup < ApplicationRecord
  belongs_to :member, optional:true
  alias_attribute :owner,:member
  has_many :members


end
