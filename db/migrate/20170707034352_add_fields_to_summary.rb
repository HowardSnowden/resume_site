class AddFieldsToSummary < ActiveRecord::Migration[5.0]
  def change
    add_column :summaries, :programming_languages, :string
    add_column :summaries, :other_skills, :string
  end
end
