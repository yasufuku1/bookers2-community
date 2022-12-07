class EventNoticesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @group_users = @group.users
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]

    EventMailer.send_mail(@mail_title,@mail_content,@group_users,@group).deliver

    render 'sent'
  end

  def sent
    redirect_to group_path(params[:group_id])
  end
end
