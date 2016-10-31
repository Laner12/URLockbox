class Link < ApplicationRecord
  belongs_to :user
  validates :url, presence: true, :url => true
  validates :title, presence: true

  enum read: [ :false, :true ]
end
