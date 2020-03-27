class Rename < ActiveRecord::Migration[6.0]
  def change
    rename_table :profile, :profiles
  end
end
