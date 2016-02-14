class CommentsController < ApplicationController
  before_action :find_comment, only: [:update, :edit, :destroy]
  before_action :find_post

  def index
    if params[:search]
      @comments = Comment.search(params[:search]).paginate(:page => params[:page]).order("updated_at DESC")
    else
      @comments = Comment.all.paginate(:page => params[:page]).order("updated_at DESC")
    end
  end

  def create
    @comment = Comment.new comment_params
    @comment.user = current_user
    if @comment.save
    else
      flash[:alert] = "Comment exists."
    end
    redirect_to post_path(@post)
  end

  def update
    @comment.update comment_params
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit([:body, :post_id, :user_id])
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

  def find_post
    @post = Post.find params[:post_id]
  end

end
