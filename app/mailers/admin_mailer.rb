class AdminMailer < ApplicationMailer
	default from: '"Aam Aadmi Party" <loksabhaquestionhour@gmail.com>'

	def send_question(question)
	  @question = question
      attachments["question_#{@question.public_id}.pdf"] = WickedPdf.new.pdf_from_string(
      	render_to_string(pdf: 'loksabha-question-#{@question.public_id}', template: 'questions/pdf_layout.pdf.erb'))
	  mail(to: "loksabhaquestionhour@gmail.com", subject: 'A New Question Has Been Asked', question: @question)
	end
end
