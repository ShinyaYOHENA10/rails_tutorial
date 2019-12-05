require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
  # 演習 pathをsignupに変更してテスト
  # 結果はRED
    get signup_path
    assert_response :success
  end

end
