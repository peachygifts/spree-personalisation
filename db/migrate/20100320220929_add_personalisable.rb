class AddPersonalisable < ActiveRecord::Migration
  def self.up
    add_column :products, :personalisable, :string
    remove_column :products, :personalisation_options
    
    add_column :variants, :personalisable, :string
    remove_column :variants, :personalisation_options
  end

  def self.down
    remove_column :products, :personalisable
    add_column :products, :personalisation_options
    add_column :variants, :personalisation_options
  end
end