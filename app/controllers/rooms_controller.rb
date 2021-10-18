class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
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
      render "rooms"
    end
  end
  
  def show
    @user = User.find_by(id: session[:user_id])
    @room = Room.find_by(params[:id])
  end

  def edit
  end

  def post
  end
  
  private
  
  def params_room
    params.permit(:room_name, :intro, :price, :address, :image)
  end
end
