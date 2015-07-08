class AddMatchIdToHeroMatch < ActiveRecord::Migration
  def change
    add_column :hero_matches, :match_id, :integer
  end
end
