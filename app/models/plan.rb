class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy, inverse_of: :plan
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true
  
  belongs_to :category, optional: true
  belongs_to :area, optional: true
  
  has_many :plans_keywords, dependent: :destroy
  has_many :keywords, through: :plans_keywords
  accepts_nested_attributes_for :keywords, :reject_if => proc { |att| att[:name].blank?}
  before_save :find_or_create_keyword
  
  belongs_to :prefecture, optional: true
  belongs_to :city, optional: true
  belongs_to :spot, optional: true
  
  has_many :favorites, foreign_key: 'plan_id', dependent: :destroy
  has_many :users, through: :favorites
  
  validates :plan_title, presence: true, length: { maximum: 50 }

  validates :category, presence: true
  
  mount_uploader :image, ImageUploader
  
  
  def self.search(search)
      return Plan.all unless search
      Plan.includes([:schedules, :category])
      .where(['plans.plan_title LIKE ? OR plans.content LIKE ? OR schedules.schedule_title LIKE ? OR categories.category LIKE ?',
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"]).references([:schedules, :category])
  end
  

  private
  
  def find_or_create_keyword
    keyword_array = [] 
    self.keywords.map{ |keyword| 
        keyword.name.strip.split(",").each do |name|
          keyword_array << name
        end
      }
      self.keywords.destroy_all
      keyword_array.each do |keyword|
        self.keywords << Keyword.find_or_create_by(name: keyword)
      end            
  end
  
  
end
