class TemplateQuestion < ApplicationRecord
  belongs_to :template, touch: true
  enum question_type: { text: 1, number: 2, date: 3 }

  validates :question_type, :question_title, presence: true

  def self.question_type_to_select
    TemplateQuestion.question_types.map { |type| [type[0].to_s.humanize, type[0].to_s] }
  end
end
