class QuestionsController < ApplicationController

  before_action :check_authentication, only: [:new, :create]
  before_action :check_authorization, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def create
    @question = current_user.question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render "new"
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
  end

  def destroy

  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end


