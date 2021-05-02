class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.pluck('body')
    render inline: '<%= @questions %>'
  end

  def show
    render inline: 'Question:    <%=  @question.body %>'
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end   
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end