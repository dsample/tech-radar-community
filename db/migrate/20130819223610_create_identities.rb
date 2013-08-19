class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user

      t.string :provider
      t.string :uid
      t.string :username
      t.string :access_token
      t.string :token_secret
      t.string :refresh_token
      t.boolean :expires
      t.string :expires_at_string
      t.datetime :expires_at

      t.string :name
      t.string :avatar_url
      t.string :profile_url

      t.timestamps
    end
    add_index :identities, :user_id
    add_index :identities, :refresh_token
    add_index :identities, :access_token
  end
end
