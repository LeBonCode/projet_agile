class AddIndexes < ActiveRecord::Migration
  def up
    add_index :subscriptions, [:user_id, :achievement_id]
    add_index :votes, [:user_id, :subscription_id]
  end

  def down
    remove_index :votes, [:subscription_id, :user_id]
    remove_index :subscriptions, [:achievement_id, :user_id]
  end
end
