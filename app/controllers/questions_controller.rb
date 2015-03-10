class QuestionsController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.create(question_params)
    redirect_to quiz_path(@quiz)
  end

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    @question.destroy
    redirect_to edit_quiz_path(@quiz)
  end
 
 
  private
    def question_params
      params.require(:question).permit(:text,
                                       :answer_one,
                                       :answer_two,
                                       :answer_three,
                                       :answer_four,
                                       :correct_answer)
    end
end
