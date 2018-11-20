class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :picture
      t.string :email
      t.date :date_of_birth
      t.string :location

      t.timestamps
    end
  end
end