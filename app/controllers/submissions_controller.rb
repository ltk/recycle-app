class SubmissionsController < ApplicationController
  
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
    @submission = Submission.find(params[:id])
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


