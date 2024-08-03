class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'



 validates :email, presence: true, uniqueness: true
 validates :password, presence: true, length: { minimum: 6 }, on: :create
end
