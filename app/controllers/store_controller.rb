class StoreController < ApplicationController
  def index
      if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @count = session[:counter]
    @products = Product.order(:title)
    @shown_message = "You've been here #{@count} times" if session[:counter] >5
    @cart = current_cart
    
  end
end
