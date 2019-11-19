class Hashtag < ApplicationRecord
  HASHTAG_REGEX = (/#[\p{L}0-9_]+/)

  has_many :hashtags_questions, inverse_of: :hashtag, dependent: :destroy
  has_many :questions, through: :hashtags_questions

  scope :have_question, -> { joins(:questions).order(:name).distinct }

  validates :name, uniqueness: true


  def self.scan_string(text)
    text.scan(HASHTAG_REGEX).map { |tag| tag.mb_chars.downcase }.uniq
  end

  def self.from_string(text)
    hashtags_list = []
    scan_string(text).each { |tag| hashtags_list << find_or_create_by(name: tag) }
    hashtags_list
  end
end
