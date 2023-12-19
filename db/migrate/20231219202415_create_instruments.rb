class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :condition
      t.string :availability
      t.string :type
      t.date :available_date
      t.integer :min_days_time
      t.integer :max_days_time

      t.timestamps
    end
  end
end
