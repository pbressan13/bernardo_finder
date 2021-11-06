class AddBarbecueFlagToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :barbecue_flag, :boolean
  end
end
