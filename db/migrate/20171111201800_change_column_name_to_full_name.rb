class ChangeColumnNameToFullName < ActiveRecord::Migration[5.0]
  def change
    rename_column :admins, :name, :full_name
  end
end
