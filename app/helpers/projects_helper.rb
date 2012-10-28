module ProjectsHelper

  def change_button(project)
    turn = project.begining ? "turn off" : "turn on"
    button_to(turn, status_project_path(project), :remote => true)
  end

  def show_interval(interval)
    interval.start.getlocal.strftime("%y.%m.%d %H:%M:%S") + \
      " - " + \
      interval.end.getlocal.strftime("%y.%m.%d %H:%M:%S")
  end

end
