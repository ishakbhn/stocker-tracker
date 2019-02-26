class Stock < ApplicationRecord

  def self.new_from_search(ticker_symbol)
    begin
      search_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: search_stock.company_name, ticker: search_stock.symbol, last_price: search_stock.latest_price)
    # if invalid ticker name return nil
    rescue Exception => e
      return nil
    end
  end

end