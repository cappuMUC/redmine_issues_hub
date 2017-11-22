require 'redmine'


Redmine::Plugin.register :redmine_issues_hub do
  name 'Redmine Issues Hub'
  author 'Bernhard Rohloff'
  description 'This plugin collects Issues, Gantt and Calendar into a single tab'
  url 'https://github.com/cappumuc/redmine_issues_hub'
  version '0.0.1'




  # Remove Gantt and Calendar from main menu
  delete_menu_item :project_menu, :calendar
  delete_menu_item :project_menu, :gantt

  delete_menu_item :application_menu, :calendar
  delete_menu_item :application_menu, :gantt


end


# Change the application menu entry for the controllers
CalendarsController.class_eval do 
  def current_menu_item
	:issues
  end
end

GanttsController.class_eval do 
  def current_menu_item
	:issues
  end
end


