class CreateTransporters < ActiveRecord::Migration
  def self.up
    create_table :transporters do |t|
      t.string :type
      t.string :modus
      t.string :address
      t.integer :port
      t.string :domain
      t.string :user_name
      t.string :password
      t.string :authentication
      t.boolean :enable_starttls_auto
      t.boolean :enable_ssl

      t.timestamps
    end
  end

  def self.down
    drop_table :transporters
  end
end
