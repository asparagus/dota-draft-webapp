class FixTypoInHeroMatchModel < ActiveRecord::Migration
  def change
    rename_column :hero_matches, :denites, :denies
  end
end
