class Skill < ActiveRecord::Base
  belongs_to :fighter
  
  validates :fighter_id, presence: true
  validates :name, presence: true, length: {minimum: 2, maximum: 35}
  validates :level, presence: true
  validates_inclusion_of :level, :in => 0..5
  validates_uniqueness_of :fighter_id, :scope => :name, :message => "already has this skill"
end
