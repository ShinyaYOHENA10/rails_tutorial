class User < ApplicationRecord
    # user「1」に対してmicropostの投稿は多
    has_many :microposts
    validates :name, presence: true    # 「FILL_IN」をコードに置き換えてください
    validates :email, presence: true    # 「FILL_IN」をコードに置き換えてください
end
