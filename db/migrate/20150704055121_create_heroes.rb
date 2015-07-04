class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.integer :dota_id
      t.string :name
      t.timestamps
    end


    add_index :heroes, :dota_id
  end
end
