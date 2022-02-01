class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  accepts_nested_attributes_for :tags, reject_if: :name_is_blank?

  validates_presence_of :name, :content

  private

  def name_is_blank?(attributes)
    attributes["name"].blank?
  end
end
