class AddWrestlerIdToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :wrestler_id, :integer
    add_index :matches, :wrestler_id
  end
end
