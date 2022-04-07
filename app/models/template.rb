class Template < ApplicationRecord
  has_many :template_questions, dependent: :destroy
  accepts_nested_attributes_for :template_questions, allow_destroy: true, reject_if: :all_blank

  validate :verifica_quantidade_questions

  def verifica_quantidade_questions
    if self.template_questions.size < 1
      puts '##############################Cadastro Obrigatório de Questions'
    end
  end

end
