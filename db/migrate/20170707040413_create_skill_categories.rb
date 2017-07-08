class CreateSkillCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_categories do |t|
      t.string :category_name
      t.string :skill_list
      t.timestamps
    end
  end
end
