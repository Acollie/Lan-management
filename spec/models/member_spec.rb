require 'rspec'
require './spec/spec_helper'
require './spec/rails_helper'

RSpec.describe Member, type: :model do
  it "should fails because missing email" do
    user = Member.new(display_name:"Test_person",password:"asdfasdf").save
    expect(user).to eq(false)
  end
  it "should pass because missing email" do
    email=Faker::Internet.email

    user = Member.new(email:email,display_name:"Test_person",password:"asdfasdf").save
    expect(user).to eq(true)
  end
end
