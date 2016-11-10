class Link < ApplicationRecord
  validates :url, presence: true, url: true
  validates :title, presence: true
  belongs_to :user
  has_many :tags, through: :link_tags
  has_many :link_tags, dependent: :destroy

  enum read: [ :false, :true ]

  def link_tag
    tags.pluck(:name).join(', ')
  end
end
