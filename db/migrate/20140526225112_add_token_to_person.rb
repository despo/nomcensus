class AddTokenToPerson < ActiveRecord::Migration
  def change
    add_column :people, :token, :string
    add_column :people, :token_time, :datetime
  end
end
