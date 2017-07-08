class PagesController < ApplicationController
  before_action :set_data
  
  def show

  end

  private 

  def set_data
  	@resume = ResumeData.new
  end
end
