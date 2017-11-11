class AddAdminNameAndOccupationToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :name, :string
    add_column :admins, :occupation, :string
  end
end
