class Hotel < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :source, presence: true
end
