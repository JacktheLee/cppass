class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :money, :integer
    add_column :users, :is_printer, :boolean
  end
end
