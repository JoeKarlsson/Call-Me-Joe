class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :image_url, presence: true
  validates :content, presence: true
end