module ApplicationHelper
  # хелпер для показа общего времени работы над проектом
  def show_spent(days,hours,minutes)
    res = ""
    res << pluralize(days,"day") + " " unless days == 0
    res << pluralize(hours,"hour") + " " unless hours == 0
    res << pluralize(minutes,"minute")
  end
end
