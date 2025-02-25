class CreateRfqs < ActiveRecord::Migration[7.2]
  def change
    create_table :rfqs do |t|
      t.timestamps
    end
  end
end
