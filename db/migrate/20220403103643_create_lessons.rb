class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :order, null: false
      t.references(:section, foreign_key: true)

      t.timestamps
    end
  end
end
