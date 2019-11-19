class HashtagsQuestion < ApplicationRecord
  belongs_to :hashtag, inverse_of: :hashtags_questions
  belongs_to :question, inverse_of: :hashtags_questions
end
