class RemoveTitleFromElements < ActiveRecord::Migration
  def self.up
    remove_column :elements, :title
  end

  def self.down
    add_column :elements, :title, :string
  end
end
