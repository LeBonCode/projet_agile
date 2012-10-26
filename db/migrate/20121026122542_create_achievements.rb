class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :title,        :null => false
      t.text :description,    :null => false
      t.timestamps
    end
  end
end
