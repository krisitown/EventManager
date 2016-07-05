class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            session[:current_user] = user.id
            redirect_to root_url
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
    end
    
    def destroy
        session[:current_user] = nil
        redirect_to root_url
    end 
end
