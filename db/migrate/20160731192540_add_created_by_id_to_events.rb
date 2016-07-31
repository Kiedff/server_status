class AddCreatedByIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :creator_id, :integer
    add_column :comments, :creator_id, :integer
  end
end
