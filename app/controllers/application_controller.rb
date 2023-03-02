class ApplicationController < ActionController::Base
    def require_user
        if guest?
            redirect_to login_path
            flash[:notice] = "You must login to have access to that page."
        end

    end

    def guest?
        !helpers.logged_in?
    end
end
