class ChangeColumnTypesInProducts < ActiveRecord::Migration[6.0]
  def up
    change_column :products, :price, :integer, using: 'price::integer'
  	change_column :products, :quantity, :integer, using: 'quantity::integer'
  end

  def down
    change_column :products, :price, :string, using: 'price::string'
  	change_column :products, :quantity, :string, using: 'quantity::integer'
  end
end
