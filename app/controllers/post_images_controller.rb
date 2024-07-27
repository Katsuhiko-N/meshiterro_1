class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user.id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end
  
  
  
  
  # 投稿データ用ストロングパラメータ
  private
  
  def post_image_params
    params.requre(:post_image).permit(:shop_name, :image, :caption)
  
  
end
