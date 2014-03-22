class AddAccessTokenToKardexUsers < ActiveRecord::Migration
  def change
    add_column :kardex_users, :access_token, :string
  end
end
