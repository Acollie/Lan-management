require "test_helper"

describe SeatBookingController do
  it "must get index" do
    get seat_booking_index_url
    must_respond_with :success
  end

  it "must get new" do
    get seat_booking_new_url
    must_respond_with :success
  end

end
