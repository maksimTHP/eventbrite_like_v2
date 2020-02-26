class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :destroy, :show]

  def create
    puts params[:title], params[:description]
    @create_event = Event.new(title: params[:title], description: params[:description], host_id: current_user.id, location: params[:location], price: params[:price], duration: params[:duration], start_date: params[:start_date])
    if @create_event.save
      puts "Un évènement a été créé"
      flash[:notice] = "Un évènement a été créé."
      redirect_to events_path
    else
      puts "Erreur dans l'enregistrement.Ton évènement a été refusé"
      flash[:alert] = "Erreur dans l'enregistrement.Ton évènement a été refusé"
      render 'new'
    end

    puts params[:start_date]
  end

  def index
  end

  def show
    @event = Event.find(params[:id])
    # @host = Event.find(params[:id]).user.first_name
    # @city = Event.find(params[:id]).user.city.name
    # @comment = Comment.new

  end

  def new
  end

  def edit
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to index_path
  end
end
