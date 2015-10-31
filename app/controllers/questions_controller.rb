class QuestionsController < ApplicationController
  def create
		@question = Question.new

		if @question.blank?
			flash[:notice] = "Error! Please enter a valid question"
		end

		form = params[:question]

		# @question.title = form[:title]
		# @question.ministry = form[:ministry]
		# @question.text = form[:text]
		# if !@question.valid?
		# 	flash[:notice] = []
		# 	@question.errors[:question].each do |e|
		# 		flash[:notice].push(e)
		# 	end
		# 	redirect_to :controller => 'questions', :action => 'question'
		# else
		# 	@question.save()
		# 	redirect_to root_path
		# end
  end

  def new
  	@question = Question.new
 #  	form = params[:question]
	# @question.name = form[:name]
	# @question.email = form[:email]
	# @question.district = form[:district]
	# @question.state = form[:state]
  end

  

end
