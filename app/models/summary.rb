class Summary < ApplicationRecord

	before_create :confirm_only_one

	
	private

	def confirm_only_one
 	   raise Exception.new("Nope") if Summary.count > 0
	end

end
