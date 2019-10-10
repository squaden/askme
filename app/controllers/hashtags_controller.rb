class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show]

  def show
    @hashtag = Hashtag.find_by!(name: params[:id])
    @questions = @hashtag.questions
  end

  def index
    @hashtags = Hashtag.all
  end

  private

  def set_hashtag
    @hashtag = Hashag.find_by(name: params[:name])
  end
end
