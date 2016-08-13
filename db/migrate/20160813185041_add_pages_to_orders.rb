class AddPagesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pages, :integer
  end
end
