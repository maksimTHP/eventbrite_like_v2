class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :stripe_customer_id
      t.references :guest, index: :true
      t.references :event, index: :true
      
      t.timestamps
    end
  end
end
