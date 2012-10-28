class SignController < ApplicationController
  skip_before_filter :authorize
  def show
  end

  def login
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to projects_path
    else
      redirect_to login_path, notice: 'Wrong username or password'
    end
  end

  def logout
  end
end
