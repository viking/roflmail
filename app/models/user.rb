class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me

  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false, :allow_blank => true

  validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => true
  validates_format_of     :email, :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, :allow_blank => true

  with_options :if => :password_required? do |v|
    v.validates_presence_of     :password
    v.validates_confirmation_of :password
    v.validates_length_of       :password, :within => 6..20, :allow_blank => true
  end

  protected

    # Checks whether a password is needed or not. For validations only.
    # Passwords are always required if it's a new record, or if the password
    # or confirmation are being set somewhere.
    def password_required?
      !persisted? || !password.nil? || !password_confirmation.nil?
    end
end
