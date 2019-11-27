class ChangeFavoriteToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_table :favorite, :favorites
  end
end
