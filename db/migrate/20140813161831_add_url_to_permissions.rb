class AddUrlToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :url, :string
  end
end
