class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: [:micropostsHome]

  def home
    @posts = Post.order("created_at DESC").limit(3)
  end

  def help
  end

  def micropostsHome
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end
end
