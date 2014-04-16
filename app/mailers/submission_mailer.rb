class SubmissionMailer < ActionMailer::Base
  default from: "help@plusfoam.com"

  def submission_email(user)
    @user = user
    @url  = 'http://www.plusfoam.com/reclaim'
    mail(to: @user.email, subject: 'Thanks for your reclaim!')
  end
end
