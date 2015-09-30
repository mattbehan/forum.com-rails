class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :location
      t.date :birthday
      t.text :bio
      t.string :website_link
      t.integer :tokens, default: 0

      t.timestamps null: false
    end
    add_index :users, :display_name, unique: true
    add_index :users, :email, unique: true
  end
end
