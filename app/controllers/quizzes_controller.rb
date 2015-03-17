require 'next-quiz-generator'

class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
    @average = Attempt.average(:result)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new(quiz_params)
   
    @quiz.save
    redirect_to @quiz
  end

  def update
    @quiz = Quiz.find(params[:id])
   
    if @quiz.update(quiz_params)
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def generate_next
    @quiz = NextQuizGenerator.getNextQuiz(Attempt.all, Quiz.all)
    redirect_to @quiz
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title, :difficulty)
    end
end
