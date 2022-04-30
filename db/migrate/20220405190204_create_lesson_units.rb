class CreateLessonUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_units do |t|
      t.string :content_block, null: false
      t.integer :order, null: false
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
