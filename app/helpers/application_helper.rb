module ApplicationHelper
  def format_flight_date(date)
    date.strftime('%m/%d/%Y')
  end

  def format_flight_time(time)
    time.strftime('%I:%M%P')
  end
end
