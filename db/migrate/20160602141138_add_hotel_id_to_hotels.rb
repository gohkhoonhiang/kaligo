class AddHotelIdToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :hotel_id, :string
  end
end
