class AddPhoneNumberToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :phone_number, :string
  end
end
