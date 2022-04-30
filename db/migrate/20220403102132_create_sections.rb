class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.string :description
      t.integer :order, null: false

      t.timestamps
    end

    add_index :sections, :order, unique: true
  end
end
