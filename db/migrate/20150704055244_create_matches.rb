class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :dota_id
      t.boolean :radiant_win
      t.integer :duration
      t.timestamps
    end

    add_index :matches, :dota_id
  end
end
