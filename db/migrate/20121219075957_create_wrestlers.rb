class CreateWrestlers < ActiveRecord::Migration
  def change
    create_table :wrestlers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :height
      t.integer :weight
      t.integer :class

      t.timestamps
    end
  end
end
