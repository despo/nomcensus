class AddPersonToChat < ActiveRecord::Migration
  def change
    add_reference :chats, :person, index: true
  end
end
