class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_reverenced_by_any_line_item
  
  
  
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence:true
  validates :price, numericality:{greater_than_or_equal_to: 0.01}
  validates :title,uniqueness: true
  validates_length_of :title, :minimum => 10, :message => "please enter at least 10 characters"
  validates :image_url,allow_blank: true,format: {
    with: %r{\.(jpg|gif|png)$}i,
    message: 'must be in accepted image format'
  }
  
  private
  # ensure that there are no line items for this cart
  def ensure_not_reverenced_by_any_line_item
    
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line item present')
      return false
    end
  end
end
