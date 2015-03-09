class AddAnswerOneToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_one, :string
  end
end
