class CreateHeroMatches < ActiveRecord::Migration
  def change
    create_table :hero_matches do |t|
      t.integer :hero_id
      t.integer :player_slot
      t.integer :item_0
      t.integer :item_1
      t.integer :item_2
      t.integer :item_3
      t.integer :item_4
      t.integer :item_5
      t.integer :kills
      t.integer :deaths
      t.integer :assists
      t.integer :leaver_status
      t.integer :gold
      t.integer :last_hits
      t.integer :denites
      t.integer :gpm
      t.integer :xpm
      t.integer :gold_spent
      t.integer :hero_damage
      t.integer :tower_damage
      t.integer :hero_healing
      t.integer :level

      # ability upgrades
      

      t.timestamps null: false
    end
  end
end
