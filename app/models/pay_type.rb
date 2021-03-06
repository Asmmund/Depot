class PayType < ActiveRecord::Base
validates :name, presence:true
attr_accessible :name,:pay_type,:locale
  has_many :order

  def self.names
    all.collect { |pay_type| pay_type.name }
  end
end
