class AddProgressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :progress, :integer
  end
end
