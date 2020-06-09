class Admin::AdminController < ApplicationController
  before_action :committee_auth
  def index
    @lan= Lan.find_by(start_date: Time.now..Time.now+30.days)
    #TODO THis needs to be neared data forward
    @tickets = Lan.last.admin_items.where(lan_ticket:true)
    @members=Member.all
  end
  private


end
