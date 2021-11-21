class PostsController < ApplicationController

  def index
  
  if params[:juusyo]
  @posts = Post.where('juusyo LIKE ?', "%#{params[:juusyo]}%")
  elsif params[:keyword]
  Post.where(['roomname LIKE(?) OR roomdata LIKE(?) OR juusyo LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
  else
  @posts = Post.all
  end
  end
  
  def new
  
  @post = Post.new
  @user = current_user.id
  end
  
  def create
  @user = current_user.id
  @post = Post.new(post_params)
  if @post.save
  flash[:notice]="登録しました"
  redirect_to :posts_roomshow
  else
  render "new"
  flash[:notice]="失敗しました"
  end
  end
  
  def show
  @user = current_user.id
  @post = Post.find(params[:id])
  end
  
  def confirm
  @user = current_user.id
  @post = Post.find_or_initialize_by(id: params[:id])
  @post.assign_attributes(post_params)
  render :confirm
		end
		
  def roomshow
  @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end
  
  def posts
  @user = current_user.id
  @posts = Post.find(current_user.id)
  end 
  
  def user
  return User.find_by(id: self.user_id)
  end
  
  def search
  @posts = Post.search(params[:keyword])
  end
  
  def destroy
  @user = current_user.id
  @post = Post.find(params[:id])
  @post.destroy
  flash[:notice] = "削除しました"
  redirect_to :posts
  end
  
 private
 
  def post_params
  params.require(:post).permit(:id, :roomname, :roomdata, :kane, :juusyo, :image, :image_cache, :hajime, :owari, :nanmei, :goukei, :user_id).merge(user_id: current_user.id)
  end
  
  def reservation_params
  params.require(:reservation).permit(:roomname, :roomdata, :kane, :juusyo, :image, :image_cache, :hajime, :owari, :nanmei, :goukei).merge(post_id: current_post.id)
  end
  
  def set_post
  @post = Post.find(params[:user_id])
  end
  
end