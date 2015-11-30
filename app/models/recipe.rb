class Recipe < ActiveRecord::Base
  paginates_per 20

  belongs_to :kitchen
  belongs_to :type_food
  belongs_to :food_preference

  validates :name_recipe,
            :kitchen,
            :type_food,
            :food_preference,
            :ingredients,
            :preparation,
            presence: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg',
                                                   'image/gif',
                                                   'image/png']
end
