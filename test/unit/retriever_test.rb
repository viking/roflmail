require 'test_helper'

class RetrieverTest < ActiveSupport::TestCase
  def setup_imap_retriever
    @attribs = {
      :address => 'mail.example.com', :port => 123,
      :user_name => "foo", :password => "bar", :enable_ssl => true
    }
    @retriever = Factory(:retriever, @attribs)

    @imap = mock('imap')
    Mail::IMAP.expects(:new).with(@attribs).returns(@imap)
  end

  test "subclass of Transporter" do
    assert_equal Transporter, Retriever.superclass
  end

  test "modus choices" do
    assert_equal [["IMAP", 'imap'], ['POP3', 'pop3']], Retriever::MODUS_CHOICES
  end

  test "imap finders" do
    setup_imap_retriever
    @imap.expects(:find).returns('foo')
    assert_equal 'foo', @retriever.find

    @imap.expects(:find).with(:bar => 'baz').returns('junk')
    assert_equal 'junk', @retriever.find(:bar => 'baz')

    @imap.expects(:last).returns('foo')
    assert_equal 'foo', @retriever.last

    @imap.expects(:last).with(:bar => 'baz').returns('junk')
    assert_equal 'junk', @retriever.last(:bar => 'baz')

    @imap.expects(:first).returns('foo')
    assert_equal 'foo', @retriever.first

    @imap.expects(:first).with(:bar => 'baz').returns('junk')
    assert_equal 'junk', @retriever.first(:bar => 'baz')
  end

  test "imap mailboxes" do
    setup_imap_retriever
    mailboxes = [stub(:name => "INBOX"), stub(:name => "Foo")]
    @imap.expects(:connection).yields(mock {
      expects(:list).with("", "%").returns(mailboxes)
    })
    assert_equal mailboxes, @retriever.mailboxes
  end

  test "imap nested mailboxes" do
    setup_imap_retriever
    mailboxes = [stub(:name => "Foo/Bar"), stub(:name => "Foo/Baz")]
    @imap.expects(:connection).yields(mock {
      expects(:list).with("", "Foo/%").returns(mailboxes)
    })
    assert_equal mailboxes, @retriever.mailboxes("Foo")
  end
end
