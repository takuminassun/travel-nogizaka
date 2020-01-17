class CommentsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_comment, only: [:show, :destroy, :edit, :update]

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
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @like = Like.new
  end

  def destroy
    @comment.destroy
  end

  def edit
  end

  def update
    @comment.update(comment_params)
  end

  def search
    @comments = Comment.search(params[:keyword])
  end

  private
    def comment_params
      params.require(:comment).permit(:place, :text, :image, { :member_ids => [] }).merge(user_id: current_user.id)
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
        unless @comment
          redirect_to root_path
        end
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

end
