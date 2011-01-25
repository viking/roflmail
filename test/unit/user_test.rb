require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "requires username" do
    user = Factory.build(:user, :username => false)
    assert !user.valid?
  end

  test "requires unique username" do
    user_1 = Factory(:user)
    user_2 = Factory.build(:user, :username => user_1.username)
    assert !user_2.valid?
  end
end
