module ApplicationHelper
  APP_NAME = 'Rails Apprication'

  def flash_message(message, klass)
    content_tag(:div, class: "alert-#{klass}") do
      concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
      concat raw(message)
    end
  end
end
