class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, :achievement
      t.boolean :succeeded, default: false
      t.timestamps
    end
  end
end
