class SessionsController < ApplicationController
  def create
    session['user_info'] = request.env['omniauth.auth']['user_info']
    redirect_to show_path, notice: "Signed in with Twitter!"
  end

  def show
    if session['user_info'].blank?
      redirect_to failure_path
    else
      @user = session['user_info']
    end
  end

  def error
    flash[:error] = "Sign in with Twitter failed!"
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out!"
  end
end
