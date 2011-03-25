class Message < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :account_id, :message_id, :data
end
