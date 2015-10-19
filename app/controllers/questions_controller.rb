class QuestionsController < ApplicationController
  def create
		question = Question.new
		question.title = params[:title]
		question.text = params[:text]
		if !question.valid?
			flash[:notice] = []
			user.errors[:user].each do |e|
				flash[:notice].push(e)
			end
			redirect_to :controller => 'questions', :action => 'new'
		else
			question.save()
			redirect_to root_path
		end
  end

  def new
  	@question = Question.new
  end

end
