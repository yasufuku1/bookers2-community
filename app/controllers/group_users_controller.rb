class GroupUsersController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.group_users.create(group_id: params[:group_id])
    redirect_to groups_path
  end

  def destroy
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to groups_path
  end

end
