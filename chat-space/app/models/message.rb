class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  # mount_uploader :image, ImageUploader
  validates :body, presence: true, if: -> { image.blank? }
  validates :image, presence: true, if: -> { body.blank? }
end
