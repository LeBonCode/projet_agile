class AddIndexes < ActiveRecord::Migration
  def up
    add_index :subscriptions, :user_id
  end

  def down
    remove_index :subscriptions, :user_id
  end
end
