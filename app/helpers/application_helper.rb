module ApplicationHelper
  def formatted_time(datetime)
    datetime.strftime("%Y-%B-%d %H:%M")
  end
end
