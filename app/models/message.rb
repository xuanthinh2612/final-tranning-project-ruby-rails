class Message < ApplicationRecord

  belongs_to :user
  mount_uploader :attachment, AttachmentUploader
  validates :body, presence: true

  scope :custom_display, -> { order(:created_at).last(10) }
end
