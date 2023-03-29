class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :brand
      t.string :mousestyle

      t.timestamps
    end
  end
end
