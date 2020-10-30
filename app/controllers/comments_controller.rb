class CommentsController < ApplicationController

  def like
    @user = current_user
    @comment = Comment.find(params[:comment_id])
    if params[:format] == 'like'
      @comment.liked_by @user
    elsif params[:format] == 'unlike'
      @comment.unliked_by @user
    end
    redirect_to post_path(@comment.post)
  end

  def new
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author, :post_id, :user_id)
  end
end
