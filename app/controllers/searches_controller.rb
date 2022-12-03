class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @word = params[:word]
    @range = params[:range]
    @search = params[:search]

    if @range == "User"
      @users = User.looks(@search, @word)
    else
      @books = Book.looks(@search, @word)
    end
  end
end
