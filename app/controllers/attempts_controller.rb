class AttemptsController < ApplicationController

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @attempts = @quiz.attempts.all
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @attempt = @quiz.attempts.create(attempt_params)
    redirect_to quiz_path(@quiz)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

 
  private
    def attempt_params
      params.require(:attempt).permit(:result)
    end
end
