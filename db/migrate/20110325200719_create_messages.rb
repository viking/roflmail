class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :message_id
      t.string :mailbox
      t.integer :account_id
      t.text :data

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
