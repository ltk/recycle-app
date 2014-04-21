class SubmissionMailer < ActionMailer::Base
  default from: "PLUSfoam Recycling Team<recycle@plusfoam.com>"

  def submission_email(user)
    @user = user
    @url  = 'http://plus-recycle.herokuapp.com/'
    mail(to: @user.email, subject: 'We received your reclaim request!')
  end
end
