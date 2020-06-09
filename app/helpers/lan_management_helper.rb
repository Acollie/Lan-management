module LanManagementHelper
  def ticket_type(id)
    if id==1
      "Member ticket"
    elsif id==2
      "Non Member ticket"
    elsif id==3
      "Visitor ticket"
    end
  end
  def paid_display(bool)
    if bool == 1
      "Paid"
    else
      "Not paid!!"
    end
  end
end
