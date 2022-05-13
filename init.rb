Redmine::Plugin.register :redmine_issues_hub do
  name 'Redmine Issues Hub'
  author 'Bernhard Rohloff'
  description 'This plugin collects Issues, Gantt and Calendar into a single tab'
  url 'https://github.com/cappumuc/redmine_issues_hub'
  version '0.0.2'




  # Remove Gantt and Calendar from main menu
  delete_menu_item :project_menu, :calendar
  delete_menu_item :project_menu, :gantt

  delete_menu_item :application_menu, :calendar
  delete_menu_item :application_menu, :gantt

  Rails.application.config.after_initialize do
    # Guards against including the module multiple time (like in tests)
    # and registering multiple callbacks
    unless CalendarsController.included_modules.include? CalendarsControllerPatch
      CalendarsController.send(:include, CalendarsControllerPatch)
    end

    unless GanttsController.included_modules.include? GanttsControllerPatch
      GanttsController.send(:include, GanttsControllerPatch)
    end
  end

end



