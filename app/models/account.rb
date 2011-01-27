class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender
  belongs_to :retriever

  accepts_nested_attributes_for :sender
  accepts_nested_attributes_for :retriever
end
