class Addcolumntofriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :santa_name, :string
    add_column :friends, :santa_email, :string
  end
end
