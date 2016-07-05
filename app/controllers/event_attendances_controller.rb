class EventAttendancesController < ApplicationController
    def create
        @event_attendance = EventAttendance.new(user_id: params[:user_id], event_id: params[:event_id])
        if @event_attendance.save
            flash[:success] = "Signed up for event successfully"
        else
            flash[:danger] = "An error occured whilst trying to sign you up for an event"
        end
        redirect_to root_url
    end
end
