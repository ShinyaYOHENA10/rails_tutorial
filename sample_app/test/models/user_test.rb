require 'test_helper'

class UserTest < ActiveSupport::TestCase
# setupメソッドは以下に続くテストより先に実行されるので、同メソッド内でインスタンス変数を定義、以降のtestメソッドで使用できるようにする
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
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
end