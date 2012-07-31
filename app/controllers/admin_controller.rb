class AdminController < ApplicationController
  def index
    @greetings = Time.now
    @total_orders = Order.count
  end
end
