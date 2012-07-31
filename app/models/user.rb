class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  attr_accessible :name,:password,:password_confirmation,:password_digest
  has_secure_password
  after_destroy :ensure_an_admin_remains
  
  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise 'Could not delete that user!'
    end
  end
end
