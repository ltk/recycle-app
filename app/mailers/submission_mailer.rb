class SubmissionMailer < ActionMailer::Base
  default from: "recycle@plusfoam.com"

  def submission_email(user)
    @user = user
    @url  = 'http://plus-recycle.herokuapp.com/'
    mail(from: 'PLUSfoam', to: @user.email, subject: 'We received your reclaim request!')
  end
end
