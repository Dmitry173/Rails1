class TestsController < ApplicationController
  before_action :find_test, only: %i[show update edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @test = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_parameters)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_parameters)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy!
    redirect_to tests_path
  end

  private

  def test_parameters
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_questions
    @questions = @test.questions
  end

  def rescue_with_test_not_found
    render plain: 'Not found'
  end
end
