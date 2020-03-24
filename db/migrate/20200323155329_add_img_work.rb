class AddImgWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :image, :string
  end
end
