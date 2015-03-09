class AddAnswerTwoToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_two, :string
  end
end
