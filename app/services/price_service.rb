require 'httparty'

class PriceService
  PRICE1_API = "https://api.myjson.com/bins/2tlb8"
  PRICE2_API = "https://api.myjson.com/bins/42lok"
  PRICE3_API = "https://api.myjson.com/bins/15ktg"

  def initialize
    @price1 = HTTParty.get(PRICE1_API)
    @price2 = HTTParty.get(PRICE2_API)
    @price3 = HTTParty.get(PRICE3_API)
  end

  def get_price(id)
    prices = {}
    prices['Price API1'] = @price1[id].nil? ? 0 : @price1[id]
    prices['Price API2'] = @price2[id].nil? ? 0 : @price2[id]
    prices['Price API3'] = @price3[id].nil? ? 0 : @price3[id]
    get_min(prices)
  end

  # Reference from http://stackoverflow.com/questions/6040494/how-to-find-the-key-of-the-largest-value-hash
  def get_min(prices)
    prices.min_by{|k,v| v}
  end
end

