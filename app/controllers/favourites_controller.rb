class FavouritesController < ApplicationController
  before_action :find_post, only: [:create, :destroy]

  def index
    @posts = current_user.favourite_posts
  end

  def create
    if user_signed_in?
      fav = Favourite.new
      fav.user = current_user
      fav.post = @post
      if fav.save
        flash[:notice] = "Added to Favourites!"
      else
        flash[:alert] = "Can't add to favourites..."
      end
      redirect_to post_path(@post)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    if user_signed_in?
      @fav = Favourite.find params[:id]
      @fav.destroy
      redirect_to post_path(@post), notice:"removed from favourites!"
    else
      redirect_to new_session_path
    end
  end

  private

  def find_post
    @post = Post.find params[:post_id]
  end
end
