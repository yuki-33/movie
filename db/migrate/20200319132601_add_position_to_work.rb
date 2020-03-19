class AddPositionToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :positon, :integer 
  end
end
