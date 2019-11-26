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
    # binding.pry
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @like = Like.new
  end

  def update
  end

  def destory
    comment = Comment.find(params[:id])
    comment.destory
  end

  private
    def comment_params
      params.require(:comment).permit(:place, :text, :image, { :member_ids => [] })
    end
    
end
