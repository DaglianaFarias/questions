class TemplateQuestion < ApplicationRecord
  belongs_to :template
  enum question_type: { text: 1, number: 2, date: 3 }

  def self.question_type_to_select
    TemplateQuestion.question_types.map { |type| [type[0].to_s.humanize, type[0].to_s] }
  end
end
