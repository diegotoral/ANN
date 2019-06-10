# fronzen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include Presentable

  self.abstract_class = true
end
