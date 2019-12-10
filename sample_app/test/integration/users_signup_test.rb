require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  # 無効なユーザー登録に対するテスト
  test "invalid signup information" do
    get signup_path
    # assert_no_differenceメソッドのブロック内でpostを使い、メソッドの引数には'User.count'を与える
    # assert_no_differenceのブロックを実行する前後で引数の値 (User.count) が変わらないことをテスト
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end
end