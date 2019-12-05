class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy, inverse_of: :plan
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true
  
  belongs_to :category, optional: true
  belongs_to :budget, optional: true
  
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
  
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :spot, presence: true
  
  mount_uploader :image, ImageUploader
  
  is_impressionable counter_cache: true
  
  acts_as_taggable
  
  
  scope :get_by_plan, ->(plan) {includes([:schedules, :prefecture, :city, :spot, :tags])
  .where("plan_title like ? OR plans.content like ? OR schedules.schedule_title LIKE ? OR schedules.content LIKE ? OR prefectures.name LIKE ? OR cities.name LIKE ? OR spots.name LIKE ? OR tags.name LIKE ?",
  "%#{plan}%", "%#{plan}%", "%#{plan}%", "%#{plan}%", "%#{plan}%", "%#{plan}%", "%#{plan}%", "%#{plan}%").references([:schedules, :prefecture, :city, :spot, :tags])}
  # scope :get_by_prefecture, ->(prefecture) {includes(:prefecture).where(prefecture: prefecture).references(:prefecture)}
  scope :get_by_category, ->(category) {includes(:category).where(category: category).references(:category)}
  scope :get_by_budget, ->(budget) {includes(:budget).where(budget: budget).references(:budget)}

  

  

  
  
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
