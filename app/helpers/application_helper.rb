module ApplicationHelper
  def status_flag(status)
    "<span class='status #{status.downcase}'>#{status.upcase}</span>".html_safe if status.present?
  end
  def system_icon_path(type)
    if type.present?
      "/icons/systems/#{type.downcase.gsub(" ", "-")}.png"
    else
      "/icons/systems/server.png"
    end
  end
  def mode_icon_path(type)
    if type.present?
      "/icons/modes/#{type.downcase.gsub(" ", "-")}.png"
    else
      "/icons/modes/server.png"
    end
  end
end
