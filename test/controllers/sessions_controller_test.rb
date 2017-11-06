require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test 'the truth' do
  #   assert true
  # end

  test 'should create new session' do
    post sessions_url, params: { login: 'MyLogin', password: 'password' }
    assert_redirected_to root_url
  end

  test 'should fail to create new session without password' do
    post sessions_url, params: { login: 'MyLogin' }
    assert_response :success
  end
end
