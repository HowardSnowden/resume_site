class Project < ApplicationRecord
   belongs_to :job, inverse_of: :projects
   validates_presence_of   :company
   has_many :bullet_points, :as => :itemable, :inverse_of => :itemable

  rails_admin do

  	field :job
    field :bullet_points
    field :from
    field :to
    field :company
    field  :description
    field :display_order
  end
end
