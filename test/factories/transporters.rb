# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :retriever do |f|
  f.modus "imap"
  f.address "mail.example.com"
  f.port 123
  f.user_name "foo"
  f.password "bar"
  f.enable_ssl true
end

Factory.define :sender do |f|
  f.modus "smtp"
  f.address "mail.example.com"
  f.port 123
  f.user_name "foo"
  f.password "bar"
  f.authentication "plain"
  f.enable_starttls_auto true
end
