class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.datetime :scheduled
      t.text :details
      t.integer :user_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
