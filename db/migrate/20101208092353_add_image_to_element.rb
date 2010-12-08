class AddImageToElement < ActiveRecord::Migration
  def self.up
    add_column :elements, :image_file_name, :string
  end

  def self.down
    remove_column :elements, :image_file_name
  end
end
