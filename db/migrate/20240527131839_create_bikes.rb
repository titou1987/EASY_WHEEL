class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :bike_name
      t.string :type
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
