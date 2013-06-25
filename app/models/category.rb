class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :classifieds

  def self.tagged_with(name)
    Category.find_by_name!(name).classifieds
  end
end
