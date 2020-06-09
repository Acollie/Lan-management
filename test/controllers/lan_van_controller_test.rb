require "test_helper"

describe LanVanController do
  it "must get index" do
    get lan_van_index_url
    must_respond_with :success
  end

end
