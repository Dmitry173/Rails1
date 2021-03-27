class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show
    render inline: '<%= @question.title %>'
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_parameters)

    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy!
  end

  private

  def question_parameters
    params.require(:question).permit(:title)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Not found'
  end
end
