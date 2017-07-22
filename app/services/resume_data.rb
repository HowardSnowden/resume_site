class ResumeData
  
  attr_accessor :jobs, :summary, :education, :projects, :skill_categories, :other_jobs
  def initialize(**params)

  	@jobs = Job.where(type: 'Job').limit(5).order(created_at: :desc).includes(:bullet_points)
  	@summary = Summary.first || Summary.new
  	@education = Education.limit(5).order(created_at: :desc)
  	@projects = Project.limit(10).order(display_order: :asc).includes(:bullet_points)
  	@skill_categories = SkillCategory.limit(5).order(created_at: :desc)
  	@other_jobs = OtherJob.limit(5).order(created_at: :desc).includes(:bullet_points)
  end
end