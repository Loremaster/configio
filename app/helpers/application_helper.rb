module ApplicationHelper
  # Use this to highlight active page's (toolbar or link).
  # data - controller with action, for example: "pages#home".
  # => "active" or "".
  def active_link?(data)
    unless data.empty?
      if data.include?("#")                                                                         # The separator for method of controller. It may not exist.
        splitten_data           = data.split("#")
        current_controller_name = splitten_data.first
        current_action_name     = splitten_data.last

        return "active" if (current_controller_name == controller.controller_name) &&
                           (current_action_name == controller.action_name)
      end
    end

    return ""
  end
end
