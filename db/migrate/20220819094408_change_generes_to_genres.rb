class ChangeGeneresToGenres < ActiveRecord::Migration[6.1]
  def change
    rename_table :generes, :genres
  end
end
