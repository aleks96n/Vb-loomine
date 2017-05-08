require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "John Smith", email: "mail@johnsmith.com",
                      password: "foobar123", password_confirmation: "foobar123")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name does not exceed maximum length" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end


  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email does not exceed maximum length" do
    @user.email = "a" * 250 + "@ut.ee"
    assert_not @user.valid?
  end

  test "checks duplicate email" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have minimal length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end


end
