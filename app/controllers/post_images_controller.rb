class PostImagesController < ApplicationController

  def new
    @post_image =PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)#投稿データとして許可されているか
    @post_image.user_id = current_user.id#ログインユーザーのidを取得
    @post_image.save
    redirect_to post_images_path
  end
  
  def index
    @post_images = PostImage.all#投稿されたを取得できる
  end
  
  def show
    @post_image =PostImage.find(params[:id])
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end      

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
