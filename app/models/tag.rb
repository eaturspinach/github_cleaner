class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :repositories, through: :taggings

  validates_presence_of :name

end
