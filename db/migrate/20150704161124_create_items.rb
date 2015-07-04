class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :dota_id
      t.string :name
      t.timestamps
    end

    add_index :items, :dota_id 
  end
end
