# frozen_literal_string: true

module Ann
  module Responders
    # Basic responder module which simply removes the location from the options.
    module JsonResponder
      def has_view_rendering?
        false
      end

      def display(resource, given_options = {})
        given_options.delete(:location)
        super resource, given_options
      end
    end
  end
end
