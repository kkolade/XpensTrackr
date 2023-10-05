class CreateBillsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :bills_items, id: false do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
    end

    # Add an index for performance, especially if you plan to query the join table
    add_index :bills_items, [:bill_id, :item_id], unique: true
  end
end