class UsersController < ApplicationController
  def index
  end
  
  def edit
  user = User.find(params[:id])
  @image = user.image
  end

  def update
  if current_user.update(user_params)
  redirect_to user_path(current_user)
  else
  render :edit
  end
  end

  def show
  @user = current_user
    
  end
  
  def new
  @user = User.new
  end
  
  def create
  @user = User.new(params.require(:user).permit(:roomname, :roomdate, :kane, :juusyo, :roomgazou))
  if @user.save
  redirect_to :users_posts
  else
  render "new"
  end
  end
  
  private

  def user_params
  params.require(:user).permit(:id, :name, :email, :image, :profile, :roomname, :roomdate, :kane, :juusyo, :roomgazou)
  end
  
end
