class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true, null: false
      t.references :votable, polymorphic: true, index: true, null: false
      t.integer :value, null: false
      t.timestamps null: false
    end
  end
end
