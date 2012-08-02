class AddLocaleToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :locale, :string, :default => 'en'
  end
  
  def down
    remove_column :products,:locale
  end
end
