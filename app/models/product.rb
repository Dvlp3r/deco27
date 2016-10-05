class Product < ActiveRecord::Base
  extend FriendlyId
  include PgSearch

  belongs_to :category

  belongs_to :gallery_image
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true
  scope :featured, -> { where(is_feature: true)}
  scope :of_children_categories, ->(ids){ joins(:category).where(categories: {id: ids}) }

  friendly_id :name, use: :slugged
  validates_presence_of :name

  paginates_per 8
  pg_search_scope :search_by_name, against: :name

  def should_generate_new_friendly_id?
    slug.blank?
  end
end
