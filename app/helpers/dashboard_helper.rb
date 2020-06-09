module DashboardHelper
  def greeting
    if Time.now.hour<1..5
      '👋 You are up early'
    elsif Time.now.hour<12
      '👋 Good Morning'
    elsif Time.now.hour<=12..17
      "👋 Good afternoon"
    else
      "👋 Good Evening"
    end
  end
end
