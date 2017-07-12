class AddDisplayOrderToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :display_order, :integer, default: 0
  end
end
