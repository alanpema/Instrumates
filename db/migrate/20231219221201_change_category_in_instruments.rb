class ChangeCategoryInInstruments < ActiveRecord::Migration[7.1]
  def change
    rename_column :instruments, :type, :category
  end
end
