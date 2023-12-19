class AddPriceToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :instruments, :price, :integer
  end
end
