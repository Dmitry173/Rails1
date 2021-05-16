class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :update, :result, :send_gist]

  def show; 

  end

  def result
    @counting_result = @test_passage.counting_result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
       TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    gist = service.call

    if service.success?
      current_user.gists.create(question: @test_passage.current_question, url: gist.html_url)
      flash[:notice] = "#{t('.success')} #{helpers.link_to(t('.github'), gist.html_url, target: "_blank")}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @
  end

  private

  def create_gist
    current_user.gists.create(question: @user_test.current_question, gist_message: url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
