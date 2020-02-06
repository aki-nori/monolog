class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer   :user_id
      t.integer   :category_id
      t.string    :image_id
      t.string    :name
      t.string    :infomation
      t.string    :place
      t.integer   :price
      t.float     :score
      t.string   :maker
      t.text      :external_page

      t.timestamps
    end
  end
end
