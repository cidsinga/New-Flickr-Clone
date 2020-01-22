class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :account_id
      t.string :title

      t.timestamps
    end
  end
end
