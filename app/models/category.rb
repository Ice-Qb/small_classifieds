class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :classifieds

  validates :name, presence: true, length: { maximum: 50 }

  def self.tagged_with(name)
    Category.find_by_name!(name).classifieds
  end
end
