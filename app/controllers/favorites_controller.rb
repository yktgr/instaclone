class FavoritesController < ApplicationController

  def index
    if current_user.favorites != nil
      @favorites = current_user.favorites
    else
      redirect_to posts_path
    end
  end

  def create
    favorite = current_user.favorites.create(post_id:params[:post_id])
      redirect_to posts_path, notice: "#{favorite.post.user.name}さんのpostをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id:params[:id]).destroy
      redirect_to posts_path, notice: "#{favorite.post.user.name}さんのpostをお気に入り解除しました"
  end

  end
