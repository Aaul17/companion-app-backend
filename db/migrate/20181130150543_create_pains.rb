class CreatePains < ActiveRecord::Migration[5.2]
  def change
    create_table :pains do |t|
      t.string :date
      t.integer :level
      t.integer :user_id

      t.timestamps
    end
  end
end
