class AddPositionToElements < ActiveRecord::Migration
  def self.up
    add_column :elements, :position, :integer
  end

  def self.down
    remove_column :elements, :position
  end
end
