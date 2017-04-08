class UpdateAnswersColumns < ActiveRecord::Migration
  def change
    remove_column :answers, :answerable_id, :integer
    remove_column :answers, :answerable_type, :string
    add_column :answers, :user_id, :integer
    add_column :answers, :question_id, :integer
  end
end
