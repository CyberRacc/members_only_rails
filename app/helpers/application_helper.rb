module ApplicationHelper
  def ordinal_day(day)
    if (11..13).include?(day % 100)
      "#{day}th"
    else
      case day % 10
      when 1 then "#{day}st"
      when 2 then "#{day}nd"
      when 3 then "#{day}rd"
      else "#{day}th"
      end
    end
  end

  def formatted_timestamp(timestamp)
    timestamp.strftime("#{ordinal_day(timestamp.day)} %B, %Y, %H:%M %Z")
  end
end
