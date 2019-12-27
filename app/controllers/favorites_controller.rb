class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
    @members = Member.all
  end


  def create
    @user_id = current_user.id
    @member_id = Member.find(params[:id]).id
    @favorite = Favorite.new(member_id: @member_id, user_id: @user_id)
    if @favorite.save
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to user_path(current_user.id)
    end
  end

end
