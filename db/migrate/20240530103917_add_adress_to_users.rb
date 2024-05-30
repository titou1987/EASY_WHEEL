class AddAdressToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :string
  end
end
