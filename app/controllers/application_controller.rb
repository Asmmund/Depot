class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
  private
  
  def current_cart
    Cart.find(session[:cart_id])
    
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id]) || request.format == 'text/html'
      redirect_to login_url, notice: 'Please log in'
    end
# TODO is authorization used for non text/html formats, fix this :
#    if request.format == 'text/html'
#      authenticate_or_request_with_http_basic('Administration') do |username, password|
#        md5_of_password = Digest::MD5.hexdigest(password)
#       username == 'admin' && md5_of_password == '5ebe2294ecd0e0f08eab7690d2a6ee69'
#      end
#    end
  end
end
