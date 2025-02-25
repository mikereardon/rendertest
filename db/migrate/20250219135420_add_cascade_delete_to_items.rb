class AddCascadeDeleteToItems < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :items, :rfqs
    add_foreign_key :items, :rfqs, on_delete: :cascade
  end
end
