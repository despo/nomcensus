class CreateChatsPlaces < ActiveRecord::Migration
  def change
    create_table :chats_places do |t|
      t.references :chat, index: true
      t.references :place, index: true
    end
  end
end
