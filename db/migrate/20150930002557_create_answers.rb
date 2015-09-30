class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text, null: false
      t.integer :author_id, index: true
      t.references :question, index: true

      t.timestamps null: false
    end
  end
end
