class CreateBlobData < ActiveRecord::Migration[8.1]
  def change
    create_table :blob_data do |t|
      t.string :blob_id
      t.text :data

      t.timestamps
    end
  end
end
