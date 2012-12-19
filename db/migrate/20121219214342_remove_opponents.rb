class RemoveOpponents < ActiveRecord::Migration
  def up
    drop_table :opponents
  end

  def down
  end
end
