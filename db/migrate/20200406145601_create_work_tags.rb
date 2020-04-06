class CreateWorkTags < ActiveRecord::Migration[6.0]
  def change
    create_table :work_tags do |t|
      t.integer :work_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
