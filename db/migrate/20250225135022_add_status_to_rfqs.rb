class AddStatusToRfqs < ActiveRecord::Migration[7.2]
  def change
    add_column :rfqs, :status, :string, null: false, default: 'draft'
  end
end
