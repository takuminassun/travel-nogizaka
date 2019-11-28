class FavoritesController < ApplicationController

  def index
    @members = Member.all
  end


  def create
    @user_id = current_user.id
    @member_id = Member.find(params[:id]).id
    @favorite = Favorite.new(member_id: @member_id, user_id: @user_id)
    if @favorite.save
      redirect_to members_path
    else
      redirect_to posts_path
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
