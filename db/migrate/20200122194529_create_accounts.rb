class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string

      t.timestamps
    end
  end
end
