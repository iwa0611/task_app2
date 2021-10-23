class RoomsController < ApplicationController
  
  def search
    if params[:area].present? #!blank?と同じ意味。空ならfalse
        @rooms = Room.where("address LIKE ?", "%#{params[:area]}%")
    elsif params[:keyword].present?
        @rooms = Room.where("intro LIKE ?", "%#{params[:keyword]}%")
             .or(Room.where("room_name LIKE ?", "%#{params[:keyword]}%"))
    else
      @rooms = Room.all
    end
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params_room)
    if @room.save
      flash[:notice] = "登録完了"
      redirect_to "/rooms/#{@room.id}"
    else
      flash[:notice] = "登録失敗"
      render "rooms/new"
    end
  end
  
  def show
    @user = User.find_by(id: session[:user_id])
    @room = Room.find_by(id: params[:id])
  end

  def edit
  end
  
  def posts
    @rooms = Room.all
  end
  
  private
  
  def params_room
    params.permit(:room_name, :intro, :price, :address, :image)
  end
end
