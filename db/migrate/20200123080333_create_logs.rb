class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :item_id
      t.string  :title
      t.text    :body
      t.string  :image_id
      t.integer :from

      t.timestamps
    end
  end
end
