class CreateBulletPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :bullet_points do |t|
      t.text :content
      t.string :itemable_type
      t.integer :itemable_id
      t.timestamps
    end
    add_index :bullet_points, [:itemable_type, :itemable_id]
  end
end
