require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get signup_path
    assert_select "title", full_title("Sign up")
    get contact_path
    assert_select "title", full_title("Contact")
  end

  def setup
    @user = users(:michael)
  end

  test "layout links when loggend in user" do
    log_in_as(@user)
    get root_path
    #ルートへのパスが2つあるかテスト
    assert_select "a[href=?]", root_path, count: 2
    #ヘルプへのパスがあるかテスト
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
