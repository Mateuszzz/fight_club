class Fighter < ActiveRecord::Base
  before_validation :default_values, on: :create

  has_many :skills, dependent: :destroy
  has_many :fights, :class_name => "Fight", :foreign_key => "first_fighter_id", dependent: :destroy
  has_many :inverse_fights, :class_name => "Fight", :foreign_key => "second_fighter_id", dependent: :destroy
  has_many :won_fights, :class_name => "Fight", :foreign_key => "winner_id", dependent: :destroy
  
  validates :first_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 15, maximum: 1000}
  validates_uniqueness_of :first_name, :scope => :last_name, :message => "in combination with last name already exists"
  
  has_attached_file :avatar
  validates :avatar, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/ 
  validates_attachment_size :avatar, less_than: 512.kilobytes
  
  def default_values
    self.experience_points = 0     
  end
  
  def all_fights
    fights | inverse_fights
  end
  
  def self.find_active
    joins(:skills).group('fighter_id').having('count(fighter_id) >=2 ')
  end
  
  def self.find_fighter(first_name, last_name) 
    if first_name.empty?
      where("last_name like ?", "%#{last_name}%")
      
    elsif last_name.empty?
      where("first_name like ?", "%#{first_name}%")
      
    else
      where("first_name like ? OR last_name like ?", "%#{first_name}%", "%#{last_name}%")
    end
  end
end
