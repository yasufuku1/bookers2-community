class EventMailer < ApplicationMailer

  def send_mail(member,event)
    @group = event[:group]
    @mail_title = event[:mail_title]
    @mail_content = event[:mail_content]

    @mail = EventMailer.new()
    mail(
      #from: 'メアド',
      to: member.email,
      #bcc: group_users.pluck(:email),
      subject: 'New Event Notice!!'
      )
  end

  def self.send_notifications_to_group(event)
    group = event[:group]
    group.users.each do |member|
      EventMailer.send_mail(member,event).deliver_now
    end
  end

  # def send_mail(mail_title, mail_content, group_users,group)
  #   @mail_title = mail_title
  #   @mail_content = mail_content
  #   @group = group
  #   mail(
  #     #from: 'メアド',
  #     to: group_users.pluck(:email),
  #     #bcc: group_users.pluck(:email),
  #     subject: 'New Event Notice!!'
  #     )
  # end

end
