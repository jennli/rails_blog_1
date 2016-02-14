class HomeController < ApplicationController

  def index
    if user_signed_in?
      @posts = Post.search_by_user(current_user)
    end
  end

  def about
  end

end
