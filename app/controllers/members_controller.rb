class MembersController < ApplicationController
  def index 
    @members = Member.all 
  end

  def show
    @member = Member.find(params[:id])
    @comment = Comment.all
  end
end
