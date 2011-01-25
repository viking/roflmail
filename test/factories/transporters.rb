# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :transporter do |f|
  f.type "MyString"
  f.modus "MyString"
  f.address "MyString"
  f.port 1
  f.domain "MyString"
  f.user_name "MyString"
  f.password "MyString"
  f.authentication "MyString"
  f.enable_starttls_auto false
  f.enable_ssl false
end
