class ReservationsController < ApplicationController
  def index
  @user = User.all
  @post = Post.all 
  @reservation = Reservation.all 
  end
  
  def confirm
  @user = current_user.id
  @post = Post.find_by(id: params[:id])
	@reservation = Reservation.new(reservation_params)
	if @reservation.save
  flash[:notice]="登録しました"
  redirect_to reservation_url(id: @reservation.id)
  else
  
	end
  end
  
  def show
  @user = current_user.id
  @post = Post.find_by(id: params[:id])
  @reservation = Reservation.find_by(id: params[:id])
  end

 private

  def post_params
  params.require(:post).permit(:id, :roomname, :roomdata, :kane, :juusyo, :image, :image_cache, :hajime, :owari, :nanmei, :goukei).merge(user_id: current_user.id)
  end
  
  def reservation_params
  params.permit(:id, :roomname, :roomdata, :kane, :juusyo, :image, :image_cache, :hajime, :owari, :nanmei, :goukei, :post_id, :user_id)
  end

  def set_reservation
  @reservation = Reservation.find_by(id: params[:id])
  end
  
end