class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def js_class_name
    action = case action_name
      when 'create' then 'New'
      when 'update' then 'Edit'
      else action_name
    end.camelize
    "Views.#{self.class.name.gsub('::', '.').gsub(/Controller$/, '')}.#{action}View"
  end
  helper_method :js_class_name
end
