class AddTypeToElements < ActiveRecord::Migration
  def self.up
    add_column :elements, :type, :string
  end

  def self.down
    remove_column :elements, :type
  end
end
