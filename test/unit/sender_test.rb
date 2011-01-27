require 'test_helper'

class SenderTest < ActiveSupport::TestCase
  test "subclass of Transporter" do
    assert_equal Transporter, Sender.superclass
  end

  test "modus choices" do
    assert_equal [["SMTP", 'smtp']], Sender::MODUS_CHOICES
  end

  test "authentication choices" do
    assert_equal [["Plain", 'plain']], Sender::AUTHENTICATION_CHOICES
  end
end
