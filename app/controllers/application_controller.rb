class ApplicationController < ActionController::Base

  private
  def member_auth
    unless current_member
      flash[:notice] = 'You are not authorised to view this page.'
      redirect_to root_path
    end
  end
  def committee_auth
    unless current_member
      flash[:notice] = 'You are not authorised to view this page.'
      redirect_to root_path
      return
    end

    unless current_member.committee
      flash[:notice] = 'Only committee can view this page.'
      redirect_to root_path
    end
  end
end
