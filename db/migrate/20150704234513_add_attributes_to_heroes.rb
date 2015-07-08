class AddAttributesToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :main_attribute, :integer
  end
end
