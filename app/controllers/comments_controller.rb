class CommentsController < ApplicationController
  
  before_action :authenticate_user!, only: [:create, :show]

  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def new
    @comment = Comment.new
    @comment.member_comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @like = Like.new
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:place, :text, :image, { :member_ids => [] }).merge(user_id: current_user.id)
    end
    
end
