class AddAnswerFourToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_four, :string
  end
end
