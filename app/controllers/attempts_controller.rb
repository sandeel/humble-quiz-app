class AttemptsController < ApplicationController

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @attempts = @quiz.attempts.all
  end

  def create
    
    @quiz = Quiz.find(params[:quiz_id])
    @attempt = @quiz.attempts.create(attempt_params)

    total_num_questions = @quiz.questions.count

    total_score=0
    for i in 1..total_num_questions
        key = ("question_" + (i).to_s)
        question = @quiz.questions.find(i)
        answer_given = params['question_'.concat(i.to_s)].to_i
        if answer_given == question.correct_answer
            total_score += 1
        end

    end

    @attempt.result=total_score
    @attempt.save

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



