class AddAttachmentBadgeToAchievements < ActiveRecord::Migration
  def self.up
    change_table :achievements do |t|
      t.has_attached_file :badge
    end
  end

  def self.down
    drop_attached_file :achievements, :badge
  end
end
