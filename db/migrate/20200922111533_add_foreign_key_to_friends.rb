class AddForeignKeyToFriends < ActiveRecord::Migration[6.0]
  def change
    add_reference :friends, :event, foreign_key: true
  end
end
