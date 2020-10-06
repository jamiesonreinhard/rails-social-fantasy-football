class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @leagues = League.all
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :content, :league_id, :user_id)
  end

end
