class AddPriorityToQueuedMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :queued_messages, :priority, :integer, default: 0
  end
end
