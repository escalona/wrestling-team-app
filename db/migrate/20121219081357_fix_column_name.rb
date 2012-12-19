class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :wrestlers, :class, :year
  end

  def up
  end

  def down
  end
end
