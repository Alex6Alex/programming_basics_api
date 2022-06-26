class CreateUserProgressStates < ActiveRecord::Migration[7.0]
  def change
    create_table :user_progress_states do |t|
      t.references :user, foreign_key: true, null: false
      t.references :learn_unit, foreign_keys: true, polymorphic: true, index: true, null: false
      t.integer :state, null: false

      t.timestamps
    end
  end
end
