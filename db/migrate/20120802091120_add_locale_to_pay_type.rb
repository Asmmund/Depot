class AddLocaleToPayType < ActiveRecord::Migration
  def self.up
    add_column :pay_types, :locale, :string,:default => 'en'
  end
  
  def self.down
    
  end
end
