class EventsController < ApplicationController
  before_action :get_event, :only => [:show, :edit, :update, :destroy]
  
  def index
    #@events = Event.all
    @events = Event.page(params[:page]).per(10)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "新增成功"
      redirect_to events_path
    else
      render :action => :new
    end
  end

  def show
    @page_title = @event.name
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "更新成功"
      #redirect_to :action => :show, :id => @event.id
      redirect_to event_path(@event)
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy
    flash[:alert] = "刪除成功"
    #redirect_to :action => :index
    redirect_to events_path
  end


private
  def get_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :birthday, :location, :category_id)
  end

end
