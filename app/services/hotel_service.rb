require 'httparty'

class HotelService
  HOTEL_API = "https://api.myjson.com/bins/1c80k"

  def initialize
    @price_service = PriceService.new
  end

  def get_hotels
    response = HTTParty.get(HOTEL_API)
    hotels = []
    raw_hotels = response['hotels']
    raw_hotels.each do |hotel|
      id = hotel['id']
      new_hotel = Hotel.find_by(hotel_id: id)
      source, price = @price_service.get_price(id)
      if !new_hotel
        new_hotel = Hotel.new
        new_hotel.hotel_id = id
        new_hotel.name = hotel['name']
        new_hotel.address = hotel['address']
        new_hotel.image = hotel['image']
        new_hotel.price = price
        new_hotel.source = source
      else
        new_hotel.price = price
        new_hotel.source = source
      end
      new_hotel.save!
      hotels.push(new_hotel)
    end
    hotels
  end
end

