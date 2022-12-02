class RelationshipsController < ApplicationController
  def create
    current_user.follow()
  end

  def destroy
  end
end
