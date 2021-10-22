class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :items_name,    null: false
      t.text :detail,          null: false
      t.integer :category_id,  null: false
      t.integer :status_id,    null: false
      t.integer :fee_id,       null: false
      t.integer :city_id,      null: false
      t.integer :delivery_date_id,      null: false
      t.integer :price,        null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
