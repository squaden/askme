class Hashtag < ApplicationRecord
  HASHTAG_REGEX = (/#[\p{L}0-9_]+/)

  has_many :hashtags_questions
  has_many :questions, through: :hashtags_questions

  validates :name, uniqueness: true

  before_validation :downcase_hastags

  def self.scan_string(text)
    text.scan(HASHTAG_REGEX).map { |hashtag| hashtag.mb_chars.downcase }.uniq
  end

  def self.from_string(text)
    hashtags_list = []
    scan_string(text).each { |hashtag| hashtags_list << find_or_create_by(name: hashtag) }
    hashtags_list
  end

  def downcase_hastags
    self.name.downcase!
  end
end
