class AddColumnsToBikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :bikes, :user, null: false, foreign_key: true
  end
end
