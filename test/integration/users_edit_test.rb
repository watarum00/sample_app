require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)#編集ページにアクセス
    assert_template 'users/edit'#editビューがレンダリングされているかどうかをチェック
    patch user_path(@user), params: { user: { name: "", email: "foo@invalid", password: "foo",
    password_confirmation: "bar" } }
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name, email: email, password: "",
    password_confirmation: "" } }
    assert_not flash.empty?#updateに成功したらflashは空ではないはず
    assert_redirected_to @user
    @user.reload#最新のユーザー情報をデータベースから再度読み込み
    assert_equal name, @user.name#ちゃんと更新されているかテスト
    assert_equal email, @user.email#上に同じ
  end
end
