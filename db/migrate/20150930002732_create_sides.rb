class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.belongs_to :question, index: true
      t.integer :creator_id, index: true
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
