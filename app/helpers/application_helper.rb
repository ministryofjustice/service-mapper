module ApplicationHelper
  def status_flag(status)
    "<span class='status #{status.downcase}'>#{status.upcase}</span>".html_safe if status.present?
  end
end
