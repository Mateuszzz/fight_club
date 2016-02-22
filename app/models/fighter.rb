class Fighter < ActiveRecord::Base
  before_validation :default_values, on: :create

  has_many :skills, dependent: :destroy
  
  validates :first_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 15, maximum: 1000}
  
  has_attached_file :avatar
  validates :avatar, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/ 
  validates_attachment_size :avatar, less_than: 512.kilobytes
  
  def default_values
    self.experience_points = 0     
  end
end
