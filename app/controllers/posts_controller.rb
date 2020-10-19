class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @user = current_user
  end

  def new
    @league = League.find(params[:league_id])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    post = @post
    @post.destroy
    redirect_to league_path(post.league)
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :content, :league_id, :user_id)
  end

end
