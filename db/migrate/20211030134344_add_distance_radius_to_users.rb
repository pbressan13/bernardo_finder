class AddDistanceRadiusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :distance_radius, :string
  end
end
