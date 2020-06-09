class PublicController < ApplicationController
  layout "public"

  def index

    if member_signed_in?
      redirect_to dashboard_path
    else
      respond_to do |format|
        format.html
        format.json { render json: {lan_date:Lan.last.start_date.to_f * 1000, member:Member.count,lan:Lan.count,events:Event.count} }
      end
    end
  end

  def about
  end
end
