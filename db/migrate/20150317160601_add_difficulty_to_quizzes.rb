class AddDifficultyToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :difficulty, :int
  end
end
