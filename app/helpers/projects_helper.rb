module ProjectsHelper

  # хелпер для вывода кнопки переключения статуса, с корректным текстом
  def change_button(project)
    turn = project.begining ? "turn off" : "turn on"
    button_to(turn, status_project_path(project), :remote => true)
  end

  # хелпер для вывода одного интервала работы
  def show_interval(interval)
    interval.start.getlocal.strftime("%y.%m.%d %H:%M:%S") + \
      " - " + \
      interval.end.getlocal.strftime("%y.%m.%d %H:%M:%S")
  end

end
