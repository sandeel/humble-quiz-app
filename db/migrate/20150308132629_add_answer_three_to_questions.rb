class AddAnswerThreeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_three, :string
  end
end
