class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :address

      t.timestamps
    end
  end
end
