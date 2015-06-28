class AddFieldsToTables < ActiveRecord::Migration
  def change
    add_column :orders, :customer_id, :integer
    add_column :orders, :product_id, :integer
  end
end
