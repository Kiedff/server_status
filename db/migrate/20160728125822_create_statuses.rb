class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :colour
      t.boolean :resolved, default: false

      t.timestamps null: false
    end
  end
end
