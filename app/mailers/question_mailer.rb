class QuestionMailer < ApplicationMailer
	default from: 'loksabhaquestionhour@gmail.com'

	def send_question(question)
	  @question = question
	  mail(to: @question.email, subject: 'Lok Sabha Question Hour: Your Question')
	  # do |format|
	  #   format.text # renders send_report.text.erb for body of email
	  #   format.pdf do
	  #     attachments['Question.pdf'] = WickedPdf.new.pdf_from_string(
	  #       render_to_string(:pdf => 'QuestionPDF',:template => 'questions/index.html.erb')
	  #     )
	  #   end
	  # end
	end

end
