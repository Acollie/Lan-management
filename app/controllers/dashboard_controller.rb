class DashboardController < ApplicationController

  def index
    @lan = Lan.where('end_date > ?', Time.zone.now).order(end_date: :asc).limit(1).first
  end
  def add_ticket

  end
end
