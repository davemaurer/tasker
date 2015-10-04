require 'test_helper'

class UserLogsInWithTwitter < ActionDispatch::IntegrationTest
  fixtures :users

  test "user logs in" do
    visit root_path

    sign_in_with_twitter

  end

end

