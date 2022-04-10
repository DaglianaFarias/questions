class Template < ApplicationRecord
  has_many :template_questions, dependent: :destroy
  accepts_nested_attributes_for :template_questions, allow_destroy: true, reject_if: :all_blank
  # validates :template_questions, length: {minimum:1, maximum: 10, message: ": Deve ter no mínimo 1 e no máximo 10 questões"}
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :maximum_and_minimum_questions


  def maximum_and_minimum_questions
    total_questions = self.template_questions.reject(&:marked_for_destruction?).size
    if total_questions > 10
      self.errors.add(:base, "Deve ter no máximo 10 questões!")
    elsif total_questions < 1
      self.errors.add(:base, "Template deve ter no mínimo 1 questão!")
    end
  end
end
