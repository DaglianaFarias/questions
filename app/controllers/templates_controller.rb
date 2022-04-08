class TemplatesController < ApplicationController
  before_action :set_template, only: [:edit, :update, :show, :destroy]

  def index
    @templates = Template.all
  end

  def show
    @questions = @template.template_questions
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(params_template)
    if @template.save
      redirect_to templates_path, notice: "Template cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @template.update(params_template)
      redirect_to templates_path
    else
      render :edit
    end
  end

  def destroy
    if @template.destroy
      redirect_to templates_path, notice: "Template excluído com sucesso!"
    else
      render :index
    end
  end

  def validate_name
    name = params[:name]
    resposta = Template.find_by(name: name).blank?
    render json: { resposta: resposta }
  end


  private

  def params_template
    params.require(:template).permit(:name,
      template_questions_attributes: [:id, :question_title, :question_type, :_destroy])
  end

  def set_template
    @template = Template.find(params[:id])
  end
end
