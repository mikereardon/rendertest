class AddUserToRfqs < ActiveRecord::Migration[7.2]
  def change
    add_reference :rfqs, :user, null: false, foreign_key: true
  end
end
