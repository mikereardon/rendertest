module StepperHelper
  def progress_width(rfq)
    case rfq.status
    when "draft"
      33/2
    when "sent"
      50
    when "locked"
      100
    else
      0
    end
  end

  def progress_value(rfq)
    case rfq.status
    when "draft"
      33
    when "sent"
      66
    when "locked"
      100
    else
      0
    end
  end

  def status_badge(rfq)
    case rfq.status
    when "draft"
      content_tag(:span, "Draft", class: "badge bg-secondary")
    when "sent"
      content_tag(:span, "Sent", class: "badge bg-primary")
    when "locked"
      content_tag(:span, "Locked", class: "badge bg-dark")
    else
      content_tag(:span, rfq.status.titleize, class: "badge bg-light text-dark")
    end
  end
end
