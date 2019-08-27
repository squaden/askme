class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Denis',
        username: 'squaden',
        avatar_url: 'https://clck.ru/HoVHc'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
                  name: 'Denis',
                  username: 'squaden'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.08.2019')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.08.2019'))
    ]

    @new_question = Question.new
  end
end
