class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User'
  has_many :hashtags_questions, dependent: :destroy
  has_many :hashtags, through: :hashtags_questions

  validates :text, presence: true, length: { maximum: 255 }

  before_save :add_hashtags

  private

  def add_hashtags
    self.hashtags.clear
    hashtags_list = Hashtag.from_string("#{text}#{answer}")
    hashtags_list.each { |hashtag| self.hashtags << hashtag }
  end

end
