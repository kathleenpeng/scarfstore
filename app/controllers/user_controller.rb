class UserController < ApplicationController
    
    def login
        session[:login] = 1
        flash[:notice] = "Logged in ......well done!"
        redirect_to :controller => :items
    end
    
    def logout
        session[:login] = nil
        flash[:notice] = "See you soon!"
        redirect_to :controller => :items
    end
    
    
    
end
