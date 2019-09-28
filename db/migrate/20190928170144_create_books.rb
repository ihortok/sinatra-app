class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false, default: ''
      t.decimal :price, default: 0
      t.string :img_url
      t.text :description
    end
  end
end
