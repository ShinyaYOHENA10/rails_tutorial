class User < ApplicationRecord
    # ハッシュ最後尾に文字数上限追加
    validates :name, presence: true, length: {maximum: 50}
    # メールアドレス標準を定める公式サイトに完全な正規表現
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX }
end
