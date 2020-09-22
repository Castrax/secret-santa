class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :send_event_mail]

  def new
    @event = current_user.events.new
    10.times do
      friend = @event.friends.build
    end
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def send_event_mail
    @friends = @event.friends
    @santas = @friends.shuffle
    @santas << @santas.first
    assignments = @santas.each_cons(2).to_a
    assignments.each do |assign|
      @friend = assign[0][0]
      @santa = assign[0][1]
      SantaMailer.santa_send(@event, @friend, @santa).deliver
      flash[:notice] = "Santa a bien été envoyé."
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :max_amount, friends_attributes: [:id, :name, :email, :_destroy])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
