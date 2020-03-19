class ChangeWorksColumnPosition < ActiveRecord::Migration[6.0]
  def change
    rename_column :works, :positon, :position
  end
end
