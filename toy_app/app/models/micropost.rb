class Micropost < ApplicationRecord
    # validationでcontents最大140文字の制約をつけた
    validates :content, length: {maximum: 140}
end
