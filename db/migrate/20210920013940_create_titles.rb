class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.string :name
      t.integer :publisher_id
      t.integer :character_id

      t.timestamps
    end
  end
end
