class AddDisplayOrderToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :display_order, :integer, default: 0
  end
end
