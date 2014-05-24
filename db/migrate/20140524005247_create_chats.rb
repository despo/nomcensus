class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :name, nil: false
      t.string :slug, nil: false

      t.timestamps
    end
  end
end
