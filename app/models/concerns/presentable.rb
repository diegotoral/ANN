# frozen_string_literal: true

module Presentable
  extend ActiveSupport::Concern

  def present
    presenter = self.class.presenter_class.new(self)
    yield presenter if block_given?
    presenter
  end

  module ClassMethods
    # Infers the presenter class to be used by {Presentable#present} (eg.
    # `User` maps to `UserPresenter`).
    #
    # @return [Class] the inferred presenter class.
    def presenter_class
      prefix = respond_to?(:model_name) ? model_name : name
      presenter_name = "#{prefix}Presenter"
      presenter_constant = presenter_name.safe_constantize

      if presenter_constant.nil?
        ::ApplicationPresenter
      else
        presenter_constant
      end
    end
  end
end
