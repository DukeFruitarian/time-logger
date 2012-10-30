class SignController < ApplicationController
  skip_before_filter :authorize

  # вьюха для вывода формы авторизации
  def show
  end

  # метод авторизации
  def login
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      session[:project_id] = user.projects.select do |project|
        project.begining
      end.first
      redirect_to projects_path
    else
      redirect_to login_path, notice: 'Wrong username or password'
    end
  end

  def logout
    session[:user_id] = nil
    session[:project_id] = nil
    redirect_to login_path
  end
end
