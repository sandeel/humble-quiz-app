class QuizScoreCalculator
  def self.getResult(questions, answers_given)

    total_num_questions = questions.count

    total_score=0.0

    questions.zip(answers_given).each do |question, answer|
        if answer == question.correct_answer
            total_score += 1.0
        end
    end

    result_percentage = ( (total_score / total_num_questions) * 100)

  end
end
