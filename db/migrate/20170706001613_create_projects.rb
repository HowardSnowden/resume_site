class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :company
      t.date :from
      t.date :to
      t.integer :job_id
      t.timestamps
    end
  end
end
