class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :typefood

  validates :name_recipe,
            :kitchen,
            :typefood,
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
