class ProfileController < ApplicationController
  before_action :member_auth

  def index

  end

  def show
    @profile = Member.find(params[:format])
  end

  def edit
    #TODO remove when they have removed this
    @seatbooking = SeatGroup.all

  end

  def update
    current_member.update(permited_params)
    redirect_to profile_index_path
  end

  def remove_account
    Member.update(first_name: '####', surname: '####', display_name: '####', committee:false)
    reset_session
    redirect_to root_path
  end
  private

  def permited_params
    params.require(:member).permit(:first_name, :display_name, :surname,:lan_van_phone_number,:lan_van_address,:lan_van_post_code,:lan_van_collection_required,:lan_van_dropoff_required,:lan_van_availability)
  end
end
