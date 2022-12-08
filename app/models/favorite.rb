class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # 7a answerコードの書き方 --start--
  #validates_uniqueness_of :book_id, scope: :user_id
  # 7a answerコードの書き方 --finish--
end
