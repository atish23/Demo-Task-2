class Gallery < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  belongs_to :user
  validates :title, presence: true
  validates :description , presence: true
  validates :photo, presence:  true
end
