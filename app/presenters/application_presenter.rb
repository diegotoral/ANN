# frozen_string_literal: true

class ApplicationPresenter < SimpleDelegator
  def initialize(model)
    super
  end

  protected

  alias_method :model, :__getobj__
end
