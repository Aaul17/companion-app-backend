class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :phone
      t.string :address
      t.date :last_seen

      t.timestamps
    end
  end
end
