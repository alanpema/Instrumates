class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :pick_up_date
      t.date :drop_off_date
      t.integer :final_price

      t.timestamps
    end
  end
end
