class AddTimeToChat < ActiveRecord::Migration
  def change
    add_column :chats, :date, :date
    add_column :chats, :time, :datetime
  end
end
