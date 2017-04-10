class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
    
    def new
        @user = User.new
    end
    
    def create 
        @user = User.create!(user_params)
        puts @user
        if @user
            session[:user_id] = @user.id
            redirect_to entries_path 
        else 
            redirect_to '/signup'
        end 
    end
    
    private
end
