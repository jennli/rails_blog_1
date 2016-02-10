class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy, :edit, :update]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).paginate(:page=>params[:page]).order("created_at DESC")
    else
      @posts = Post.all.paginate(:page=>params[:page]).order("created_at DESC")
    end
  end

  def show
    # column_names = [:id, :body, :created_at, :updated_at, :post_id]
    # @comments = Comment.where(post_id: @post.id).pluck(*column_names).map{|x| Hash[column_names.zip(x)]}
    @comments = @post.comments
  end

  def create
    @post = Post.new post_params
    if   @post.save
      # flash[:notice] = "Question created successfully"
      redirect_to post_path(@post), notice: "post created successfully"
    else
      flash[:alert] = "Error, check errors below!"
      render :new
    end

    @post
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    @post.update post_params
    redirect_to post_path(@post), notice: "Post updated successfully"
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit([:title, :body])
  end

end
