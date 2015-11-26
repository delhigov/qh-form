class HomeController < ApplicationController
  def index
  	@question = Question.new
  end

  def about
  end
end