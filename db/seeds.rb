# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
if Member.count==0
  Member.create(first_name:'Admin',email:'test@test.com',display_name:'Admin',paid_membership:true,password:'admin_test')
end
5.times do
  first_name=Faker::Name.first_name
  surname= Faker::Name.last_name
  email=Faker::Internet.email
  display_name=Faker::Internet.username
  password='12345678'
  valid_membership=SecureRandom.random_number(2)
  Member.create(first_name:first_name,surname:surname,email:email,display_name:display_name,password:password,paid_membership:valid_membership)
  
end
