class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "User created successfully!"
            session[:current_user] = @user.id
            redirect_to root_url
        else 
            flash.now[:danger] = "An error(s) occured while trying to create user"
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
        
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
