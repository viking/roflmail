# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :account do |f|
  f.name "foo@example.com"
  f.association :user
  f.association :retriever
  f.association :sender
end
