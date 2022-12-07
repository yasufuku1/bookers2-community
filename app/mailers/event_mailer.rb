class EventMailer < ApplicationMailer
  def send_mail(mail_title, mail_content, group_users,group)
    @mail_title = mail_title
    @mail_content = mail_content
    @group = group
    mail(
      #from: 'メアド',
      to: group_users.pluck(:email),
      #bcc: group_users.pluck(:email),
      subject: 'New Event Notice!!'
      )
  end

end
