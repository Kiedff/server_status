class RemoveAasmStateFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :aasm_state, :string
  end
end
