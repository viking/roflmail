# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :account do |f|
  f.name "MyString"
  f.retriever_id 1
  f.sender_id 1
end
