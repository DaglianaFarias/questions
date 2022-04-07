class TemplatesController < ApplicationController
  before_action :set_template, only: [:edit, :update, :destroy]

  def index
    @templates = Template.all
  end

  def show
    @questions = TemplateQuestion.all
  end

  def new
    @template = Template.new
    @template.template_questions.build
  end

  def create
    @template = Template.new(params_template)
    if @template.save
      redirect_to templates_path, notice: "Template cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @template.update(params_template)
      redirect_to templates_path
    else
      render :edit
    end
  end

  def destroy
    if @template.destroy
      redirect_to templates_path
    else
      render :index
    end
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
