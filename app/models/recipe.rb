class Recipe < ActiveRecord::Base
  paginates_per 20

  belongs_to :kitchen
  belongs_to :typefood
  belongs_to :foodpreference

  validates :name_recipe,
            :kitchen,
            :typefood,
            :foodpreference,
            :ingredients,
            :preparation,
            presence: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg',
                                                   'image/gif',
                                                   'image/png']
end
