class Admin::TestsController < Admin::BaseController
  
  before_action :set_tests, only: [:index, :update_inline]
  before_action :set_test, only: [:show, :edit, :update, :destroy, :update_inline]

  def index
    @tests = Test.all
  end

  def show; end

  def new 
    @test = Test.new 
  end

  def create
    @test = current_user.own_tests.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test.author), notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end    
  end

  def update_inline
    if @test.update(permitted_params)
      redirect_to admin_tests_path
      puts '-' * 50
      puts @tests.pluck(:id, :title)
      puts '-' * 50
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_test_path
  end

private

  def set_test
   @test = Test.find(params[:id]) 
  end
  
  def set_tests
      @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'    
  end
end
