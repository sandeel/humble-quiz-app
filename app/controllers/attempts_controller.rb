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

    total_num_questions = @quiz.questions.count

    total_score=0.0
    for question in @quiz.questions.all
        key = ("question_" + question.id.to_s)
        answer_given = params['question_'.concat(question.id.to_s)].to_i
        if answer_given == question.correct_answer
            total_score += 1.0
        end
    end

    result_percentage = ( (total_score / total_num_questions) * 100)

    @attempt.result=result_percentage
    @attempt.save

    redirect_to quiz_attempt_path(@quiz, @attempt)
  end

  private
    def attempt_params
      params.require(:attempt).permit(:question_1)
    end
end



