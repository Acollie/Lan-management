class EventController < ApplicationController

  def index
    @events= Event.all
  end

  def show
    @event = Event.find(params[:format])
    @scores = @event.scores.order(:amount)
  end

  def edit
  end

  def new
  end

  def score_add
    member_auth
    Event.find(params[:format]).scores.create(member:current_member, amount:permited_params['amount'])
    redirect_to event_show_url(params[:format])
  end

  private

  def permited_params
    params.require(:score).permit(:amount)
  end
end
