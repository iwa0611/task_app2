class ReservesController < ApplicationController
  def index
  end
  
  def new
    @room = Room.new(params.permit(:id, :price, :start_date, :end_date, :person_num))
    if params[:start_date].empty? || params[:end_date].empty? || params[:person_num].empty?
      flash[:notice] = "日付と人数を入力してください"
      redirect_to "/rooms/#{@room.id}"
    end
  end
  
  def create
    @room = Room.find_by(id: params[:id])
    if @room.update(params.permit(:start_date, :end_date, :total_price, :user_id))
      flash[:notice] = "予約完了"
      redirect_to "/reserves/#{@room.id}"
    else
      redirect_to "/rooms/#{@room.id}"
    end
  end
  
  def show
    @room = Room.find_by(id: params[:id])
  end
  
  def reserved
    @rooms = Room.where(user_id: current_user[:id])
  end
  
end
