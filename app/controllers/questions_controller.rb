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
      if @question.email?
      	 mail(:to => @question.email, :subject => "awesome pdf, check it") do |format|
    		format.text # renders send_report.text.erb for body of email
    		format.pdf do
      			attachments['MyPDF.pdf'] = WickedPdf.new.pdf_from_string(
        		render_to_string(:pdf => 'MyPDF',:template => 'reports/show.pdf.erb')
      		)
      		end
    	end
 	end
      redirect_to root_path
    end
end
end
