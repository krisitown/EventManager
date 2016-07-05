class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date_on
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
