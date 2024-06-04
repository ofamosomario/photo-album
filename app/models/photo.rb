# frozen_string_literal: true

# Photo Model
class Photo < ApplicationRecord
  has_one_attached :image

  validates :caption, presence: true
  validates :caption, length: { maximum: 100 }
  validates :image, presence: true
  validate :image_extension, :image_size, :image_resize

  after_commit :rename_image, on: :create

  private

  def image_size
    return unless image.attached? && image.byte_size > 200.kilobytes

    errors.add(:image, 'must be less than 200 KB')
  end

  def image_extension
    return unless image.attached? && !image.content_type.in?(%w[image/jpeg image/png])

    errors.add(:image, 'must be a JPEG or PNG file')
    image.purge
  end

  def image_resize
    ## ImageMagick isn't working correctly on my MacOs

    # return unless image.attached?

    # img = MiniMagick::Image.new(image)
    # return unless img.width > 300 || img.height > 300

    # img.resize('300x300>')
    # img.attach(io: File.open(img.path), filename: img.filename)
  end

  def rename_image
    return unless image.attached?

    image.blob.update!(filename: "#{id}.jpg")
  end
end
