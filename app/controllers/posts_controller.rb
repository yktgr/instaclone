class PostsController < ApplicationController
    before_action :access_user
    before_action:edit_post,only:[:edit,:update,:destroy]
    before_action :set_post,only:[:show,:edit,:update,:destroy]

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
        ContactMailer.contact_mail(@post).deliver
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


  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"編集しました"
    else
      render 'edit'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id:@post.id)
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:user_id,:image,:image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def edit_post
    @post = Post.find_by(id: params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end


end
