class Classified < ActiveRecord::Base
  attr_accessible :address, :city, :content, :email_address, :title
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 120 }
  validates :content, presence: true, length: { maximum: 500 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }
  validates :city, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 80 }                  
  validates :user_id, presence: true
  default_scope order: 'classifieds.created_at DESC'
end
