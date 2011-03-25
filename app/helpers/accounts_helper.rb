module AccountsHelper
  def mailbox_tag(name)
    current = params[:mailbox] || "INBOX"
    content_tag(:li, name, :class => (current == name ? 'mailbox current' : 'mailbox'))
  end
end
