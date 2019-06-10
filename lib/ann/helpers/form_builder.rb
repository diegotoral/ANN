module Ann
  module Helpers
    # A simple extension to ActionView's form builder that makes easy display
    # error messages for each attribute in the form.
    #
    # Usage:
    #   <%= ann_form_for record, class: 'form', url: url_for(record) do |f| %>
    #     <%= f.label :name %>
    #     <%= f.text_field :name %>
    #     <%= f.error_message :name %>
    #   <% end %>
    class FormBuilder < ActionView::Helpers::FormBuilder
      def error_message(attribute, options = {})
        return if object.errors.empty?

        @template.content_tag(:p, object.errors.full_messages_for(attribute).first, options)
      end
    end
  end
end
