class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  attr_accessible :address, :email, :name, :pay_type, :pay_type_id

  belongs_to :pay_type
  validates :name, :address, :email,presence: true
  validates :pay_type_id, presence: true
  validates :email,allow_blank: false,format: {
    with: %r{^[A-Z0-9\._%\+\-]+\@[A-Z0-9\.-]+\.[A-Z]{2,4}$}i,
    message: 'Email must be present and of acceptable format'}
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  
end
