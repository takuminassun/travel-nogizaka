class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favorite = Favorite.where("user_id = ?", @user)
    # @favorite = Favorite.new
  end

  def new
    @members = Member.all
    @favorite = Favorite.new
    # @user.favorites.build
  end

  def edit
  end

  def update
  end

end
