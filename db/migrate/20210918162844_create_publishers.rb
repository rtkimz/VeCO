class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :name, default: "unknown"

      t.timestamps
    end
  end
end
