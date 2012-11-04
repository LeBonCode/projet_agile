class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, :subscription
      t.timestamps
    end
  end
end
