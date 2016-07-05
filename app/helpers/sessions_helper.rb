module SessionsHelper
    def logged_in?
        if session[:current_user] != nil
            return true
        else 
            return false
        end
    end
end
