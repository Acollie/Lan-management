class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  has_many :scores
  has_many :attendees
  has_one :seat_group
  belongs_to :seat_group, optional:true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
