class CommentsController < ApplicationController
before_action :admin_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment Created!"
      redirect_to post_path(@post)
    else
      flash[:success] = "Comment Failed! #{@comment.errors.full_messages}"
      redirect_to post_path(@post)    
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy 
    redirect_to(@comment.post)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
