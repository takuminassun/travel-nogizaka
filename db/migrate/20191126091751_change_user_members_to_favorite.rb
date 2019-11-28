class ChangeUserMembersToFavorite < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_members, :favorite
  end
end
