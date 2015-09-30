class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|

      t.references :editable, polymorphic: true, index: true
      t.integer :author_id, index: true
      t.text :changes, null: false
      t.text :explanation

      t.timestamps null: false
    end
  end
end
