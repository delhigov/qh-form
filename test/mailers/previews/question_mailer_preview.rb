# Preview all emails at http://localhost:3000/rails/mailers/question_mailer
class QuestionMailerPreview < ActionMailer::Preview
  def send_question_preview
    QuestionMailer.send_question(Question.first)
  end
end
