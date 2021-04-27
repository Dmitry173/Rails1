class SessionsController < ApplicationController
  after_action :delete_session_previous_link, only: :create

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:previous_link] || tests_path
    else
      flash.now[:notice] = 'Are you a Guru? Verify your email and password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private

  def delete_session_previous_link
    session.delete(:previous_link)
  end

end
