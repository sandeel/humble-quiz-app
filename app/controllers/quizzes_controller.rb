class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
  end

  def create
    @quiz = Quiz.new(quiz_params)
   
    @quiz.save
    redirect_to @quiz
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title)
    end
end
