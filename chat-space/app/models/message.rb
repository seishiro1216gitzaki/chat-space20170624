class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :body, presence: true, if: -> { image.blank? }
  validates :image, presence: true, if: -> { body.blank? }
  validates :user_id, presence: true
  validates :group_id, presence: true
end
