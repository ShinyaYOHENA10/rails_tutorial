class Micropost < ApplicationRecord
    # micropost投稿に対してuserは1対1
    belongs_to :user
    # validationでcontents最大140文字の制約をつけた
    validates :content, length: {maximum: 140},
    presence: true
end
