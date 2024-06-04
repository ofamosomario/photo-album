# frozen_string_literal: true

# PhotoSerializer
class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :caption, :avatar

  def avatar
    object.image.filename.to_s if object.image.attached?
  end
end
