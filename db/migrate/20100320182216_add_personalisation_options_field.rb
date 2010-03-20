class AddPersonalisationOptionsField < ActiveRecord::Migration
  def self.up
    add_column :products, :personalisation_options, :string
    add_column :variants, :personalisation_options, :string
  end

  def self.down
    remove_column :variants, :personalisation_options
    remove_column :products, :personalisation_options
  end
end