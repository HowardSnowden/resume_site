class CreateProfessionalReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :professional_references do |t|
      t.string :full_name 
      t.string :company 
      t.string :position 
      t.string :phone_number
      t.integer :display_order, default: 0
      t.string :email 
      
      t.timestamps
    end
  end
end
