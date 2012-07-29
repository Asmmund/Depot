class PayType < ActiveRecord::Base
  attr_accessible :name,:pay_type
  has_many :order

  def self.names
    all.collect { |pay_type| pay_type.name }
  end
end
