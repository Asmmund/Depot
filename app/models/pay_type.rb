class PayType < ActiveRecord::Base
  attr_accessible :name
  has_many :order

  def self.names
    all.collect { |payment_type| payment_type.name }
  end
end
