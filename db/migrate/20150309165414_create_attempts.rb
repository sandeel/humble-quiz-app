class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :quiz, index: true
      t.integer :result

      t.timestamps null: false
    end
    add_foreign_key :attempts, :quizzes
  end
end
