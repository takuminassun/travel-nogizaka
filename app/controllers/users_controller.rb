class UsersController < ApplicationController
  def index
    @users = User.all
    @members = Member.all
  end

  def show
    
    if user_signed_in?
      @user = current_user
      @favorite = Favorite.where("user_id = ?", @user)
    else 
      redirect_to edit_user_registration_path
    end

  end

  def new
    @members = Member.all
    @favorite = Favorite.new
  end

end
