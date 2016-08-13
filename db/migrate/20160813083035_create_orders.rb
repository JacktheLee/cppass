class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string        :file
      t.boolean       :is_double_side
      t.boolean       :is_color
      t.integer       :slide_per_page
      t.integer       :price
      t.integer       :location
      t.integer       :quantity
      t.references    :user
      t.timestamps
    end
  end
end
