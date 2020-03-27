class Profile < ActiveRecord::Migration[6.0]
  def change
    create_table :profile do |t|
      t.integer 'user_id'
      t.string 'first_name'
      t.string 'last_name'
      t.text 'introduction'
      t.string 'image'

      t.timestamps
    end
  end
end
