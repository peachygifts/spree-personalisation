class AddPersonalisationOptions < ActiveRecord::Migration
  def self.up
    create_table :personalisation_options, :force => true do |t|
      t.string :name
      t.string :title
      t.integer :max_length
      t.integer :product_id
      t.timestamps
    end
    add_column :products, :personalisation_option_id, :integer
  end

  def self.down
    remove_column :products, :personalisation_option_id
    drop_table :personalisation_options
  end
end