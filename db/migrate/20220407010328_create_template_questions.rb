class CreateTemplateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :template_questions do |t|
      t.text :question_title
      t.integer :question_type
      t.references :template_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
