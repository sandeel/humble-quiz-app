class QuizScoreCalculator
  def self.getResult(questions, answers_given)

    # get the total number of questions
    total_num_questions = questions.count

    # initialise the score
    total_score=0.0

    # zip the questions and answers together and iterate over each
    # if the answer given is correct, increase the total score
    questions.zip(answers_given).each do |question, answer|
        if answer == question.correct_answer
            total_score += 1.0
        end
    end

    # calculate the score as a percentage of the questions asked
    result_percentage = ( (total_score / total_num_questions) * 100)

    return result_percentage

  end
end
