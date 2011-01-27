require 'test_helper'

class RetrieverTest < ActiveSupport::TestCase
  test "subclass of Transporter" do
    assert_equal Transporter, Retriever.superclass
  end

  test "modus choices" do
    assert_equal [["IMAP", 'imap'], ['POP3', 'pop3']], Retriever::MODUS_CHOICES
  end

  test "mail finders" do
    attribs = {
      :address => 'mail.example.com', :port => 123,
      :user_name => "foo", :password => "bar", :enable_ssl => true
    }
    retriever = Factory(:retriever, attribs)

    imap = mock('imap')
    Mail::IMAP.expects(:new).with(attribs).returns(imap)
    imap.expects(:find).returns('foo')
    imap.expects(:find).with(:bar => 'baz').returns('junk')
    imap.expects(:last).returns('foo')
    imap.expects(:last).with(:bar => 'baz').returns('junk')
    imap.expects(:first).returns('foo')
    imap.expects(:first).with(:bar => 'baz').returns('junk')

    assert_equal 'foo', retriever.find
    assert_equal 'junk', retriever.find(:bar => 'baz')
    assert_equal 'foo', retriever.last
    assert_equal 'junk', retriever.last(:bar => 'baz')
    assert_equal 'foo', retriever.first
    assert_equal 'junk', retriever.first(:bar => 'baz')
  end
end
