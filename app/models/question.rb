class Question < ApplicationRecord

  belongs_to :user

  validates :text, :user, presence: true, length: { maximum: 255 }
  validates :user, presence: true

endqxit
