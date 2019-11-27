class FavoritesController < ApplicationController
  def create
    @user_id = current_user.id
    @member_id = Member.find(params[:id]).id
    @favorite = Favorite.new(member_id: @member_id, user_id: @user_id)
    if @favorite.save
      redirect_to member_index_path
    else
      redirect_to posts_path
    end
    # @favorite = current_user.likes.create(member_id: params[:member_id])
    # redirect_to users_path
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
