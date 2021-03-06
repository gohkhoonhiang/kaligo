class HotelsController < ApplicationController
  def list
  end

  def new
    @hotel = Hotel.new
  end

  def edit 
    @hotel = Hotel.find(params[:id])
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def index
    @hotels = HotelService.new.get_hotels
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      redirect_to @hotel
    else
      render 'edit'
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    redirect_to hotels_path
  end

  private
    def hotel_params
      params.require(:hotel).permit(:name, :address, :image, :price, :source)
    end
end
