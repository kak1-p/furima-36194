class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,  null: false
      t.integer :city_id,     null: false
      t.string :town,         null: false
      t.string :number,       null: false
      t.string :building
      t.string :tell,         null: false
      t.references :order,    foreign_key: true
      t.timestamps
    end
  end
end
