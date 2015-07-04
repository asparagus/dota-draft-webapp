class AddHeroIcons < ActiveRecord::Migration
  def change
    add_column :heroes, :icon, :string
  end
end
