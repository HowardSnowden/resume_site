class Job < ApplicationRecord 
  has_many :projects,  inverse_of: :job
  validates_presence_of :from, :to, :location, :company, :job_title
  has_many :bullet_points, :as => :itemable, :inverse_of => :itemable

  rails_admin do
    field :bullet_points
    field :from
    field :to
    field :location
    field :company
    field :job_title
  end
end
