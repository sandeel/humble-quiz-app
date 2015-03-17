require 'quiz-score-calculator'

class AttemptsController < ApplicationController

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @attempts = @quiz.attempts.all
  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @attempt = @quiz.attempts.find(params[:id])
  end

  def create
    
    @quiz = Quiz.find(params[:quiz_id])
    @attempt = @quiz.attempts.create(attempt_params)

    questions = @quiz.questions.all
    answers_given = []

    for question in questions
        key = ("question_" + question.id.to_s)
        answers_given.push(params['question_'.concat(question.id.to_s)].to_i)
    end

    # Use the QuizScoreCalculator gem to calculate the user's result
    result_percentage = QuizScoreCalculator.getResult(questions, answers_given)

    @attempt.result=result_percentage
    @attempt.save

    redirect_to quiz_attempt_path(@quiz, @attempt)
  end

  private
    def attempt_params
      params.require(:attempt).permit(:question_1)
    end
end



