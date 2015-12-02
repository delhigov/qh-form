class QuestionMailer < ApplicationMailer
	default from: '"Aam Aadmi Party" <loksabhaquestionhour@gmail.com>'

	def send_question(question)
	  @question = question
	  mail(to: @question.email, subject: 'Lok Sabha Question Hour: Your Question')
	end
end
