module ProjectsHelper
  def status_to_word(status)
    status ? "on" : "off"
  end

  def change_button(project)
    turn = project.working ? "turn off" : "turn on"
    button_to(turn, status_project_path(project), :remote => true)
  end

end
