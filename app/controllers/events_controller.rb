class EventsController < ApplicationController
    def new
        @event = Event.new
    end
    
    def create
        @event = User.find(session[:current_user]).events.build(event_params)
        if @event.save
            flash[:success] = "Event created successfully"
            redirect_to root_url
        else
            flash.now[:danger] = "An error(s) occured when creating the event"
            render 'new'
        end
    end        
        
    def index
        @events = Event.order('events.date_on ASC').all.paginate(page: params[:page], :per_page => 5)
    end        
   
    private
        def event_params
            params.require(:event).permit(:name, :location, :date_on)
        end
end
