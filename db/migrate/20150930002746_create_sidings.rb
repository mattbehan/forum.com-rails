class CreateSidings < ActiveRecord::Migration
  def change
    create_table :sidings do |t|

      t.belongs_to :answer, index: true, null: false
      t.belongs_to :side, index: true, null: false

      t.timestamps null: false
    end
  end
end
