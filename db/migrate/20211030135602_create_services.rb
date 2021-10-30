class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :available
      t.decimal :price_hour
      t.text :address
      t.text :description
      t.string :title
      t.string :available_at
      t.integer :min_duration
      t.integer :max_duration

      t.timestamps
    end
  end
end
