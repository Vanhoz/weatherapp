require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test 'the truth' do
  #   assert true
  # end
  test 'should create User' do
    user = User.new login: 'Somelogin', password: 'somepass'
    assert user.save
  end

  test 'should not create User without login or password' do
    user = User.new
    assert_not user.save
  end

  test 'should not create User if login already exists' do
    user = User.new login: 'Somelogin', password: 'somepass'
    assert user.save
    user = User.new login: 'Somelogin', password: 'somepass2'
    assert_not user.save
  end

  test 'should be able to set admin' do
    user = User.new login: 'Somelogin', password: 'somepass', admin_role: true
    assert user.save
  end
end
