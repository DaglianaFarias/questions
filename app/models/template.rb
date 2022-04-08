class Template < ApplicationRecord
  has_many :template_questions, dependent: :destroy
  accepts_nested_attributes_for :template_questions, allow_destroy: true, reject_if: :all_blank
  validates :template_questions, length: {minimum:1, maximum: 3, message: ": Deve ter no mínimo 1 e no máximo 10 questões"}

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
