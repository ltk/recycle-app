class SubmissionsController < ApplicationController
  before_filter :authenticate_admin!, except: [:show]

  def index
    @submission = Submission.all
  end

  def new
    @submission = submission.new
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    @submission = Submission.new(params[:submission])

    if @submission.save
      redirect_to(root_path, :notice => "Boom! We're looking forward to receiving your product!")
    else
      render :new
    end
  end

  def show
    SubmissionMailer.submission_email(current_user).deliver
    @submission = Submission.find(params[:id])
  end

  def change_status
    submission = Submission.find(params[:id])
    if submission.status == Submission::STATUS_PENDING
      SubmissionMailer.received_email(submission.user).deliver
      submission.update_attribute(:status, Submission::STATUS_RECEIVED) 
    else
      submission.update_attribute(:status, Submission::STATUS_PROCESSED)
    end

    redirect_to submissions_path
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end
end


