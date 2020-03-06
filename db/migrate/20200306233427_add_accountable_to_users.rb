class AddAccountableToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :accountable, polymorphic: true, null: false
  end
end
