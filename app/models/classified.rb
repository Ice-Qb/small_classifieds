class Classified < ActiveRecord::Base
  attr_accessible :address, :city, :content, :email_address, :title, :image, :category_id
  belongs_to :user
  belongs_to :category  
  validates :title, presence: true, length: { maximum: 120 }
  validates :content, presence: true, length: { maximum: 500 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }
  validates :city, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 80 }                  
  validates :user_id, presence: true
  validates :category_id, presence: true
  mount_uploader :image, ImageUploader
  default_scope order: 'classifieds.created_at DESC'
end
