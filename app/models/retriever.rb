class Retriever < Transporter
  MODUS_CHOICES = [['IMAP', 'imap'], ['POP3', 'pop3']]

  def find(*args, &block)
    mail.find(*args, &block)
  end

  def last(*args, &block)
    mail.last(*args, &block)
  end

  def first(*args, &block)
    mail.first(*args, &block)
  end

  private
    def mail
      if @mail.nil?
        klass =
          case modus
          when 'imap' then Mail::IMAP
          end
        @mail = klass.new({
          :address => address, :port => port,
          :user_name => user_name, :password => password,
          :enable_ssl => enable_ssl
        })
      end
      @mail
    end
end
