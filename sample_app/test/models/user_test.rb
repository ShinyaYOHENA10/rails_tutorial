require 'test_helper'

class UserTest < ActiveSupport::TestCase
# setupメソッドは以下に続くテストより先に実行されるので、同メソッド内でインスタンス変数を定義、以降のtestメソッドで使用できるようにする
  def setup
    @user = User.new(
    name: "Example User", email: "user@example.com",
    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
# 文字数の長さ検証
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
# 有効なメールフォーマットをテストする
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
# メールフォーマットの検証に対するテスト 失敗用
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
# メールアドレスの重複拒否 以下では@user情報の重複のためテスト結果はerror
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    # 大・小文字の区別がされないため以下の1文追記
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
# 演習
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
# pass空白可否テスト
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
# pass5桁で登録可否テスト
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 2
    assert_not @user.valid?
  end
end