class Kitchen < ActiveRecord::Base
  has_many :recipes
  validates :name, presence: true
end
