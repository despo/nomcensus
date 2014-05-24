class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :chat, index: true
      t.references :person, index: true
      t.references :place, index: true

      t.timestamps
    end
  end
end
