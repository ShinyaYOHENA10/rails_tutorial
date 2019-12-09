class User < ApplicationRecord
    #  email属性を小文字に変換してメールアドレスの一意性を保証
    # before_save { self.email = email.downcase } 下の破壊的メソッドと同じ結果
    before_save { email.downcase! }
    # ハッシュ最後尾に文字数上限追加
    validates :name, presence: true, length: {maximum: 50}
    # メールアドレス標準を定める公式サイトに完全な正規表現
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
end
