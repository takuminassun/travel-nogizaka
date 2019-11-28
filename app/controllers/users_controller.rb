class UsersController < ApplicationController
  def index
    @users = User.all
    @members = Member.all
  end

  def show
    @user = User.find(params[:id])
    @favorite = Favorite.where("user_id = ?", @user)
  end

  def new
    @members = Member.all
    @favorite = Favorite.new
  end

end
