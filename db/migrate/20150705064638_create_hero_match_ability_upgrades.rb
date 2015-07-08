class CreateHeroMatchAbilityUpgrades < ActiveRecord::Migration
  def change
    create_table :hero_match_ability_upgrades do |t|
      t.integer :hero_match_id
      t.integer :ability_id
      t.integer :level
      t.integer :time

      t.timestamps null: false
    end
  end
end
