class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user_id, presense: true
  validates :group_id, presence: true
end
