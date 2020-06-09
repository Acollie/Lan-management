class SeatBookingController < ApplicationController
  #PAssword protected
  def index
    @seatbooking= SeatGroup.all
  end

  def new
  end
  def join
    current_member.update(seat_group:SeatGroup.find(params[:format]))
    redirect_to seat_booking_index_path

  end
  def join_group

  end
  def create
    seat_group=SeatGroup.new()
    seat_group.name=permitted_params[:name]
    seat_group.owner=current_member
    seat_group.save
    current_member.update(seat_group:seat_group)
    redirect_to seat_booking_index_path

  end
  def leave

  end
  def permitted_params
    params.require(:seat_group).permit(:name,:password)
  end
  def join_params
    params.require(:seat_group).permit(:id,:password)
  end
end
