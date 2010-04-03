class Personalisation < ActiveRecord::Migration
  def self.up
    add_column :products, :personalisable, :string
    add_column :variants, :personalisable, :string
    create_table :personalisation_options do |t|
      t.string :name
      t.string :title
      t.integer :max_length
      t.integer :product_id
      t.timestamps
    end
    create_table :personalisation_details do |t|
      t.string :name
      t.string :title
      t.string :value
      t.integer :line_item_id
      t.timestamps
    end
  end

  def self.down
    remove_column :products, :personalisable
    remove_column :variants, :personalisable
    drop_table :personalisation_options
    drop_table :personalisation_details
  end
end