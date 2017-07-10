class BulletPoint < ApplicationRecord
 belongs_to :itemable, polymorphic: true, inverse_of: :bullet_points

  default_scope { order(created_at: :desc) }

end
