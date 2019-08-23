class UsersController < ApplicationController
  def show
    @hello = 'Привет, бро!'
    @time = Time.now
  end
end
