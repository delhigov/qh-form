class QuestionsController < ApplicationController
  def show
    @questions = Question.all
  end

  def index
    @questions = Question.where(status: Question::STATUSES[:answered])
  end

  def create
    @question = Question.new(question_params)
    if @question.valid?
      @question.save
      if @question.email? 
      	QuestionMailer.send_question(@question).deliver_now
        AdminMailer.send_question(@question).deliver_now
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
    @question = Question.find_by(public_id: params[:public_id])
    render :pdf => "loksabha-question-#{@question.public_id}",
      :template => 'questions/pdf_layout.pdf.erb',
      :show_as_html => params[:debug].present?
  end

  def receipt
    @tracking_id = params[:q]
    if @tracking_id.present?
      @question = Question.find_by(tracking_id: params[:q])
    end
  end
  
end
