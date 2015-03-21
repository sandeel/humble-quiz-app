class NextQuizGenerator
  def self.getNextQuiz(users_previous_attempts, available_quizzes)

    ## if the user hasn't done more than three quizzes just give them
    ## the first three quizzes in order to get an idea of their level

    if users_previous_attempts.count <= 3
      return available_quizzes.find(users_previous_attempts.count)
    end

    
    ## after the user has done more than three quizzes 
    ## get an average of their scores so far

    scores_so_far = []
    for attempt in users_previous_attempts
        if attempt.result
            scores_so_far.push(attempt.result)
        end
    end

    average_score_based_on_attempts =  (scores_so_far.sum / scores_so_far.size.to_f)


    ## sort the quizzes in descending order of difficulty and
    ## iterate through them until we find one matching the user's level

    for quiz in available_quizzes.order('difficulty DESC')
        if quiz.difficulty < average_score_based_on_attempts
            return quiz
        end
    end


    ## if all else fails just return the first quiz

    return available_quizzes.find(1)
  end
end
