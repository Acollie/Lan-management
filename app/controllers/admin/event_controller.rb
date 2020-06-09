class Admin::EventController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  end

  def edit
    @event = Event.find(params[:format])
  end
  def create
    #TODO This needs to be changed before final
    Lan.first.events.create(permited_params)
    redirect_to admin_event_index_path
  end

  def show
  end
  def update
    Event.find(params[:format]).update(permited_params)
    redirect_to admin_event_index_path

  end
  def remove
    Event.find(params[:format]).destroy
    redirect_to admin_event_index_path
  end
  private
  def permited_params
    params.require(:event).permit(:name,:start_time,:is_competition)
  end
end
