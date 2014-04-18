class SubmissionMailer < ActionMailer::Base
  default from: "recycle@plusfoam.com"

  def submission_email(user)
    @user = user
    @url  = 'http://plus-recycle.herokuapp.com/'
    mail(to: @user.email, subject: 'Your PLUS product has arrived!')
  end


  def received_email(user)
    @user = user
    @url  = 'http://plus-recycle.herokuapp.com/'
    mail(to: @user.email, subject: 'Your PLUS product has arrived!')
  end
end
