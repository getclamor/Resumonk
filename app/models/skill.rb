class Skill < ActiveRecord::Base
  belongs_to :resume
  validates :skill, presence: true

end
