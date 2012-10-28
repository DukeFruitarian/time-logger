module ProjectsHelper

  def change_button(project)
    turn = project.begining ? "turn off" : "turn on"
    button_to(turn, status_project_path(project), :remote => true)
  end

end
