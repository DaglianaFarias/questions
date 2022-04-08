class Template < ApplicationRecord
  has_many :template_questions, dependent: :destroy
  accepts_nested_attributes_for :template_questions, allow_destroy: true, reject_if: :all_blank


  validate :verifica_quantidade_questions
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def verifica_quantidade_questions
    size_questions = self.template_questions.size

    if size_questions < 1
      self.errors.add(:base, "Cadastre pelo menos uma questão!")
    elsif size_questions > 10
      self.errors.add(:base, "Limite máximo de questões é 10!")
    end
  end
end
