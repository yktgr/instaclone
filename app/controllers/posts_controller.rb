class PostsController < ApplicationController
    before_action :access_user
    before_action :user_edit,only:[:edit,:update,:destroy]
    before_action :set_post,only:[:show,:edit,:update,:destroy,:user_edit]

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
    @favorite = current_user.favorites.find_by(post_id:@post.id)
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

  def user_edit
    if @post.user_id != current_user.id
      render 'posts_path',notice:"権限がありません"
    end
  end

  private
  def post_params
  params.require(:post).permit(:title,:content,:user_id,:image,:image_cashe)
  end

  def set_post
  @post = Post.find(params[:id])
  end



end
