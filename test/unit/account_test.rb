require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "belongs_to user" do
    assert_respond_to Account.new, :user
  end

  test "belongs_to sender" do
    assert_respond_to Account.new, :sender
  end

  test "belongs_to retriever" do
    assert_respond_to Account.new, :retriever
  end

  test "accepts_nested_attributes_for sender" do
    assert_respond_to Account.new, :sender_attributes=
  end

  test "accepts_nested_attributes_for retriever" do
    assert_respond_to Account.new, :retriever_attributes=
  end
end
