class SubmissionsController < ApplicationController
  def new
    @submission = submission.new
  end

  def create
    @submission = Submission.new(params[:submission])

    if @submission.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end
end
