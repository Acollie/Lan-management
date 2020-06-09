class Admin::MemberController < ApplicationController
  before_action :committee_auth
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:format])
  end

  def edit
    @member = Member.find(params[:format])
  end
  def update
    Member.find(params[:format]).update(permited_params)
    redirect_to admin_member_index_path

  end
  def remove

  end
  private

  def permited_params
    params.require(:member).permit(:first_name,:surname,:committee,:display_name,)
  end
end
