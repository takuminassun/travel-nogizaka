class UsersController < ApplicationController
  before_action :user_admin, only: [:index]

  def show
    
    if user_signed_in?
      @user = current_user
      @favorite = Favorite.where("user_id = ?", @user)
    else 
      redirect_to edit_user_registration_path
    end

  end

  def index
    @users = User.all
    @comments = Comment.all
    @comment = Comment.find(params[:id])
  end

  private
    def user_admin
      @users = User.all
      if current_user.admin == false
        redirect_to root_path
      else
        render action: "index"
      end
    end

end
