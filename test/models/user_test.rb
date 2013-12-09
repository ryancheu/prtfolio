require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_create_user
    _email = "test@test.com"
    _fullname ="Test tester"
    _uid="1234"
    _auth_token="asdf"
    _username="testusername"
    _user = User.create(:email => _email, :fullname => _fullname, :uid => _uid, :auth_token => _auth_token, :username => _username)
      
    assert _user.has_portfolio?
  end

  def test_create_project
    _email = "test@test.com"
    _fullname ="Test tester"
    _uid="1234"
    _auth_token="asdf"
    _username="testusername"
    _user = User.create(:email => _email, :fullname => _fullname, :uid => _uid, :auth_token => _auth_token, :username => _username)
      
    _project = _user.new_project
    assert !_project.nil?
    assert _project = _user.portfolio.projects.first
  end

  def test_find_user
    _email = "test@test.com"
    _fullname ="Test tester"
    _uid="1234"
    _auth_token="asdf"
    _username="testusername"
    _user = User.create(:email => _email, :fullname => _fullname, :uid => _uid, :auth_token => _auth_token, :username => _username)
      
    _userfound = User.find_by_uid_or_create(1234, {:email => _email, :fullname => _fullname, :uid => _uid, :auth_token => _auth_token, :username => _username});
    assert _user == _userfound
  end

end
