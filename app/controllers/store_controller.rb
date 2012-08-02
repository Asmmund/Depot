class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @count = session[:counter]
      @products = Product.order(:title).find(:all,:conditions =>{:locale=>I18n.locale})
      @cart = current_cart
    end
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end

    
  end
end
