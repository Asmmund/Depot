class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @count = session[:counter]
      @products = Product.order(:title)
      @shown_message = "You've been here #{@count} times" if session[:counter] >5
      @cart = current_cart
    end
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end

    
  end
end
