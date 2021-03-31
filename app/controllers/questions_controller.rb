class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create new]
  before_action :find_question, only: %i[destroy show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_parameters)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_parameters)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to tests_path
  end

  private

  def question_parameters
    params.require(:question).permit(:title, :test)
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

