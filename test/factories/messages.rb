# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :message do |f|
  f.sequence(:message_id) { |n| "#{n}.#{Time.now.to_i}@example.com" }
  f.mailbox "INBOX"
  f.association :account
  f.data do |m|
    str = <<EOF % DateTime.now.inspect
Date: %s
To: Guy <guy@example.com>
Subject: testing
From: Gal <gal@example.com>
MIME-Version: 1.0
Content-Type: text/plain

sup?

EOF
    m.message_id ? "Message-ID: <#{m.message_id}>\n" + str : str
  end
end
