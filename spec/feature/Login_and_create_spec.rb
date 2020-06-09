require 'rspec'
require './spec/spec_helper'
require './spec/rails_helper'
require 'faker'

describe 'Login_and_edit_user' do


  before do
  end

  after do
    # Do nothing
  end

  context 'when logged in' do

    it 'Edit when not logged in should redirect' do
      visit profile_index_path
      expect(page).to have_content('You are not authorised to view this page.')
    end
    it "it should redirect due to permissions" do
      login
      visit admin_path
      expect(page).to have_content('Only committee can view this page.')

    end

    it 'Edit user page' do
      login
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      display_name = Faker::Internet.username
      visit profile_index_path
      click_on 'Edit'
      fill_in 'member_first_name',with:first_name
      fill_in 'member_surname',with: last_name
      fill_in 'member_display_name',with: display_name
      click_on "Update Member"
      expect(page).to have_content("Hi #{first_name}")
      expect(page).to have_content("Display name :#{display_name}")
    end
  end
  def login
    visit root_path
    click_on 'login'
    fill_in 'member_email',with:'asdf@asdf.com'
    fill_in 'member_password',with:'f4k3p455w0rd'
    click_on 'Log in'
  end
end