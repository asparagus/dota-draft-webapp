class AddDataToItemModel < ActiveRecord::Migration
  def change
    add_column :items, :cost, :integer
    add_column :items, :secret_shop, :boolean
    add_column :items, :side_shop, :boolean
    add_column :items, :recipe, :boolean
  end
end
