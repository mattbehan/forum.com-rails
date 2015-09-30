class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.belongs_to :user, index: true, null: false
      t.references :commentable, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
