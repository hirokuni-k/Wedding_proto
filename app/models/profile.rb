class Profile < ApplicationRecord
     belongs_to :planner
     has_one_attached :image
end
