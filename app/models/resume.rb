class Resume < ActiveRecord::Base
  belongs_to :user
  
  has_many :educations
  accepts_nested_attributes_for :educations, :reject_if => lambda { |a| a[:institute_name].blank? }, :allow_destroy => true
  
  has_many :experiences
  accepts_nested_attributes_for :experiences, :reject_if => lambda { |a| a[:company_name].blank? }, :allow_destroy => true
  
  has_many :skills
  accepts_nested_attributes_for :skills, :reject_if => lambda { |a| a[:skill].blank? }, :allow_destroy => true
  
  validates :firstname, :lastname, :address, presence: true
  # validates :phone, format: { with: /[0-9]{10}/ }, allow_blank: true
  
  before_create :create_short_link
  
  private
    def create_short_link
      self.short_link = Rufus::Mnemo.from_i(rand(8**5))
    end
end
