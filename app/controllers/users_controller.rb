class UsersController < ApplicationController

  def show
    
    if user_signed_in?
      @user = current_user
      @favorite = Favorite.where("user_id = ?", @user)
    else 
      redirect_to edit_user_registration_path
    end

  end

end
