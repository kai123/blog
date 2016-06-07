class AddAvatarToAdminuser < ActiveRecord::Migration
  def change
  	add_column :adminusers, :avatar, :string
  end
end
