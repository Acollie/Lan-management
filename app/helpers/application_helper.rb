module ApplicationHelper
  def date_time(time)
    "at #{time.strftime('%I:%M%p')}"
  end

  def long_date(time)
    time.strftime('%m/%d/%Y at %I:%M%p').to_s
  end

  def table_date(time)
    time.strftime('%m/%d/%Y %I:%M%p').to_s
  end
end
