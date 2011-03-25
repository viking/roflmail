require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "belongs_to account" do
    assert_respond_to Message.new, :account
  end

  test "requires account_id" do
    message = Factory.build(:message, :account => nil)
    assert !message.valid?
  end

  test "requires message_id" do
    message = Factory.build(:message, :message_id => nil)
    assert !message.valid?
  end

  test "requires data" do
    message = Factory.build(:message, :data => nil)
    assert !message.valid?
  end
end
