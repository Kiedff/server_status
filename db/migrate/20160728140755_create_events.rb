class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.datetime :active_at
      t.datetime :resolved_at
      t.integer :status_id
      t.string :aasm_state

      t.timestamps null: false
    end
  end
end
