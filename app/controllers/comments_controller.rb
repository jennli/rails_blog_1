class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update, :edit, :destroy]

  def index
    if params[:search]
      @comments = Comment.search(params[:search]).paginate(:page => params[:page]).order("updated_at DESC")
    else
      @comments = Comment.all.paginate(:page => params[:page]).order("updated_at DESC")
    end
  end

  def new
    @comment = Comment.new
  end
  #
  # def show
  # end

  def create
    @comment = Comment.new comment_params
    if @comment.save
      # redirect_to comment_path(@comment)
    else
      flash[:alert] = "Comment exists."
    end
    # byebug
    redirect_to post_path(@comment.post_id)
  end

  def update
    @comment.update comment_params
    @comment.save

    redirect_to post_path(@comment.post_id)
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit([:body, :post_id])
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

end
