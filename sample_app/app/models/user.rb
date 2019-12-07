class User < ApplicationRecord
    # ハッシュ最後尾に文字数上限追加
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255}
end
