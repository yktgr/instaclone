class PostsController < ApplicationController
  before_action :set_post,only:[:show,:edit,:update,:destroy,:edit]

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
    @post = Post.new(post_params)
    else
    @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end

  def edit
  end

  def show
  end

  def update
    if @post.update(post_params)
    redirect_to posts_path, notice:"編集しました"
    else
    render 'edit'
    end
  end

  def confirm
   @post = current_user.posts.build(post_params)
   render :new if @post.invalid?
  end

  private
  def post_params
  params.require(:post).permit(:title,:content,:user_id)
  end

  def set_post
  @post = Post.find(params[:id])
  end
end
