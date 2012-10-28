module ProjectsHelper
  def status_to_word(status)
    status ? "on" : "off"
  end
end
