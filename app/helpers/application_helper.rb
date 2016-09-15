# frozen_string_literal: true
module ApplicationHelper
  # バリデーションエラー表示
  def error_messages_for(resource)
    return if resource.blank? || resource.errors.none?

    content_tag(:div, class: 'alert alert-danger error-messages') do
      content_tag(:a, '&times;'.html_safe, data: { dismiss: 'modal' }, href: '#', class: 'close') <<
        content_tag(:ul) do
          resource.errors.full_messages.each do |msg|
            concat(content_tag(:li, msg))
          end
        end
    end
  end
end
