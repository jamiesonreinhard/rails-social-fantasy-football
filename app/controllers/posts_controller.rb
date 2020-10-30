class PostsController < ApplicationController

  respond_to :js, :html, :json

  def index
    @league = League.find(params[:league_id])
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @user = current_user
  end

  def like
    @user = current_user
    @post = Post.find(params[:id])
    if params[:format] == 'like'
      @post.liked_by @user
    elsif params[:format] == 'unlike'
      @post.unliked_by @user
    end
    redirect_to post_path(@post)
  end

  def new
    @league = League.find(params[:league_id])
    @leagues = League.all
    @post = Post.new
    @post_types = ['Power Rankings', 'Regular Post']
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
    @post_types = ['Power Rankings', 'Regular Post']
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
    params.require(:post).permit(:title, :author, :content, :league_id, :user_id, :post_type, :document)
  end

end
