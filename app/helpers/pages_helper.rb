module PagesHelper
  
  def from_to(obj)

	"#{obj.from.try(:strftime, '%Y') } - #{date_or_present(obj.to)}" 
  end

  def date_or_present(date)
  	 return unless date.is_a?(Date)
  	 date >= (Date.today - 3.months) ? 'Present' : date.strftime('%Y')
  end
end
