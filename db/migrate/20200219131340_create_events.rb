class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :price
      t.integer :duration
      t.datetime :start_date
      t.references :host, index: :true

      t.timestamps
    end
  end
end
