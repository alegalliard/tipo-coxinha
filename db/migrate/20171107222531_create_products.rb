class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.references :delivery_type, foreign_key: true
      t.references :unity, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
