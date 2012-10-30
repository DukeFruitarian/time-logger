class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where(:user_id => session[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # обработка AJAX запроса при нажатии кнопки смены режима.
  # Вычисляется текущий проект и проект,
  # работу над которым нужно завершить. Проверяются условия
  # начала\завершения. В куки записывается id текущего проекта
  def change_status
    current = Project.find_by_id(params[:id])
    current.change_status
    finished = Project.find_by_id(session[:project_id])

    if finished
      if finished == current
        if current.begining
          @project = current
        else
          @project = nil
          @total_spent = current.total_spent
          @total_spent << current.id
        end
      elsif current.begining
        finished.change_status
        @project = current
      else
        @project = nil
      end
    else
      @project = (current if current.begining)
    end
    session[:project_id] = (@project.id if @project)

    respond_to do |format|
      format.js
    end
  end
  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = User.find(session[:user_id]).projects.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    session[:project_id] = nil if session[:project_id] == @project.id
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
