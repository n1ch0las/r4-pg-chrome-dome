class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :profile_image_url
      t.string :provider
      t.string :token
      t.string :token_secret
      t.string :uid
      t.integer :user_id

      t.timestamps
    end
  end
end
