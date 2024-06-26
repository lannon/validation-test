require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "johns must have an email" do 
    user = User.new(name: "John")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "non johns don't have to have an email" do 
    user = User.new(name: "Linda")
    assert user.valid?
  end

  test "non johns must have a valid email if email is specified" do
    user = User.new(name: "Linda", email: "not an email")
    assert_not user.valid?
    assert_includes user.errors[:email], "is invalid"
  end
end
