class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags

  validates :title, presence: true
  validates :content, presence: true
end
