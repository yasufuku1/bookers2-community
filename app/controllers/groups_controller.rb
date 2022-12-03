class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new

  end

  def index
    @groups = Group.all
    @book = Book.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
  end

  def edit
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end
end
