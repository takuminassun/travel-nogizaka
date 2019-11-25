class CommentsController < ApplicationController
  

  def index
    @comments = Comment.all
  end

  # def show
  # end

  def new
    @comment = Comment.new
    @comment.member_comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    # binding.pry
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
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
