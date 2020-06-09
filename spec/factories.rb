require 'faker'
FactoryBot.define do
  factory :Member do
    email { Faker::Internet.email }
    password { 'f4k3p455w0rd' }
    # using dynamic attributes over static attributes in FactoryBot

    # if needed
    # is_active true
  end
end