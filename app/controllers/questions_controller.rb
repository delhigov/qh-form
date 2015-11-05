class QuestionsController < ApplicationController
  def show
    @questions = Question.all
  end

  def index
  	@question = Question.find(params[:id])
  end

  def new
    session[:question_params] ||= {}
    @question = Question.new(session[:question_params])
    @question.current_step = session[:question_step]
  end

def create
    session[:question_params].deep_merge!(params[:question]) if params[:question]
    @question = Question.new(session[:question_params])
    @question.current_step = session[:question_step]
    if @question.valid?
      if params[:back_button]
        @question.previous_step
      elsif @question.last_step?
        @question.save if @question.all_valid?
        if @question.email? 
      		QuestionMailer.send_report(@question).deliver
      	end
      else
        @question.next_step
      end
      session[:question_step] = @question.current_step
    end

    if @question.new_record?
      render "new"
    else
      session[:question_step] = session[:question_params] = nil
      flash[:notice] = "Question saved!"
      redirect_to root_path
    end
end
end
