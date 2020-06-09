require 'rspec'
require './spec/spec_helper'
require './spec/rails_helper'
require 'factory_bot'
require 'faker'

describe 'Authentication' do
  # member = FactoryBot.create(:Member)
  # member.save
  member= Member.create(email:'asdf@asdf.com',password:'f4k3p455w0rd')
  before do

  end

  after do
    Warden.test_mode!
    member.destroy
  end

  context 'Handle login' do
    it 'Should pass since simple registion' do
      visit root_path
      click_on 'Register'
      email = Faker::Internet.email
      password ='asASDFASDFASDF'
      fill_in 'member_email',with: email
      fill_in 'member_password',with: password
      fill_in 'member_password_confirmation',with:password
      click_on 'Sign up'
      # sign_up_with(member.password,member.password)
      # login_as(member, :scope => :member, :run_callbacks => false)
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    it "should allow user to signup" do
      visit root_path
      click_on 'login'
      fill_in 'member_email',with:'asdf@asdf.com'
      fill_in 'member_password',with:'f4k3p455w0rd'
      click_on 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
    it "invalid password should fail" do
      visit root_path
      click_on 'login'
      fill_in 'member_email',with:'asdf@asdf.com'
      fill_in 'member_password',with:'asdfasdfasdf'
      click_on 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
    it 'Should fail since email is already in use' do
      visit root_path
      click_on 'Register'
      email = member.email
      password ='asASDFASDFASDF'
      fill_in 'member_email',with: email
      fill_in 'member_password',with: password
      fill_in 'member_password_confirmation',with:password
      click_on 'Sign up'
      # sign_up_with(member.password,member.password)
      # login_as(member, :scope => :member, :run_callbacks => false)
      expect(page).to have_content('Email has already been taken')
    end
  end
end