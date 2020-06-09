class LanController < ApplicationController
  def index
    @lan= Lan.all
    load_lans
    lan_info
  end

  def show
    @lan = Lan.find(params[:format])
  end

  def new
    committee_auth
    @lan= Lan.new
  end

  def edit
    committee_auth
    @lan = Lan.find(params[:format])

  end
  def update
    committee_auth
    Lan.find(params[:format]).update(permited_params)
    redirect_to lan_index_path
  end
  def create
    Lan.create(permited_params)
  end
  def add_user
    if Attendee.find_by(lan:params[:format],member:current_member).nil?
      Lan.find(params[:format]).attendees.create(member:current_member)
      redirect_to lan_index_url
    else
      flash[:warning] = "Please note that we already have a record that you are attetending."
    end
  end
  def remove_user
    Attendee.find_by(member: current_member, lan: params[:format]).destroy
  end

  def load_lans
    @lans_future=[]
    @lans_past=[]
    Lan.all.each do |lan|
      if lan.start_date.future?
        @lans_future<<lan
      else
        @lans_past<<lan
      end
    end
  end
  def lan_info
    @largest=Lan.first
    @smallest=Lan.first
    Lan.all.each do |lan|
      if @largest.attendees.count < lan.attendees.count
        @largest = lan
      end
      if @largest.attendees.count > lan.attendees.count
        @smallest = lan
      end
    end
  end

  private
  def permited_params
    params.require(:lan).permit(:name, :about, :location, :start_date, :end_date,:tickets_available,:tickets_price_member,:ticket_price_non_member,:ticket_price_visitor)
  end
end
