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
      @friends = @event.friends
      @santas = @friends.shuffle
      @santas << @santas.first
      assignments = @santas.each_cons(2).to_a
      assignments.each do |assign|
        @friend = Friend.where(name: assign[0].name)[0]
        @friend.santa_name = Friend.where(email: assign[1].email)[0].name
        @friend.santa_email = Friend.where(email: assign[1].email)[0].email
        @friend.save
      end
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
    SantaMailer.santa_send(@event, @friends).deliver
    flash[:notice] = "Santa a bien été envoyé."
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :max_amount, friends_attributes: [:id, :name, :email, :_destroy])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
