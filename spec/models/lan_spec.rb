require 'rspec'
require './spec/spec_helper'
require './spec/rails_helper'
require 'faker'

RSpec.describe Lan, type: :model do
  it "Should pass" do
    lan = Lan.new(name:'Test_lan',start_date:Time.now+10.days,end_date:Time.now+12.days).save
    expect(lan).to eq(true)
  end
  it "Should fail since date is in the past" do
    lan = Lan.new(start_date:Time.now-10.days, end_date:Time.now+12.days).save
    expect(lan).to eq(false)
  end
  it "Should fail since " do
    lan = Lan.new(start_date:Time.now+10.days, end_date:Time.now+9.days).save
    expect(lan).to eq(false)
  end
end
