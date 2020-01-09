class CommentsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @comments = Comment.all
    @comment = Comment.new
    if user_signed_in?
      @user = current_user
      @favorite = Favorite.where("user_id = ?", @user)
    else 
      
    end
  end

  def new
    @comment = Comment.new
    @comment.member_comments.build
  end

  def create
    # binding.pry
    @comment = Comment.new(comment_params)
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

  def search
    @comments = Comment.search(params[:keyword])
  end

  private
    def comment_params
      params.require(:comment).permit(:place, :text, :image, { :member_ids => [] }).merge(user_id: current_user.id)
    end
    
end
