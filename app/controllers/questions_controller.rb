class QuestionsController < ApplicationController
  def show
    @questions = Question.all
  end

  def index
  	@question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.valid?
      @question.save
      if @question.email? 
      	QuestionMailer.send_question(@question).deliver_now
      end
      redirect_to controller: 'questions', action: 'receipt', q: @question.tracking_id
    end
  end

  def question_params
    params.require(:question).permit(:title, :ministry, :text, :city, :name, :email, :district, :state)
  end

  def track 
    @question = Question.find_by(tracking_id: params[:q])
  end 

  def read 
    @questions = Question.where(status: "Answered")
  end

  def receipt
    @tracking_id = params[:q]
    if @tracking_id.present?
      @question = Question.find_by(tracking_id: params[:q])
    end
  end
  
end
