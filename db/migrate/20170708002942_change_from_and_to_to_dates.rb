class ChangeFromAndToToDates < ActiveRecord::Migration[5.0]
  def change
  	change_column :educations, :from, 'date USING CAST("from" AS date)'
 	change_column :educations, :to,  'date USING CAST("to" AS date)'
  end 
end
