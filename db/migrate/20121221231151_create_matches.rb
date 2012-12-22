class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :opp_first_name
      t.string :opp_last_name
      t.date :match_date
      t.string :school
      t.string :result
      t.string :tournament
      t.integer :wrestler_id

      t.timestamps
    end
  end
end
