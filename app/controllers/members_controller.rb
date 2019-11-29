class MembersController < ApplicationController
  def index 
    @members = Member.all 
  end

  def show
    @user = current_user.id
    @member = Member.find(params[:id])
    @comment = Comment.all
  end
end
