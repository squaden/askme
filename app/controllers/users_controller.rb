class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Denis',
        username: 'squaden',
        avatar_url: 'https://clck.ru/HoVHc'
      ),
      User.new(
        id: 2,
        name: 'Vasya',
        username: 'vasilich'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
                  name: 'Denis',
                  username: 'squaden',
                  avatar_url: 'https://clck.ru/HoVHc'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.08.2019')),
      Question.new(text: 'В чем смысл?', created_at: Date.parse('27.08.2019')),
      Question.new(text: 'Есть ли жизнь?', created_at: Date.parse('12.09.2019')),
      Question.new(text: 'Как проехать?', created_at: Date.parse('13.09.2019')),
      Question.new(text: 'Сколько это будет?', created_at: Date.parse('14.09.2019'))
    ]

    @new_question = Question.new
  end
end
