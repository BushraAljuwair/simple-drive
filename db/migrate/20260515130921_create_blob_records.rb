class CreateBlobRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :blob_records do |t|
      t.string :blob_id
      t.integer :size

      t.timestamps
    end
  end
end
