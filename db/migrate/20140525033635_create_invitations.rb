class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :chat, index: true
      t.references :person, index: true
      t.boolean :accepted, default: nil

      t.timestamps
    end
  end
end
