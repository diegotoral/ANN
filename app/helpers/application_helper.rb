module ApplicationHelper
  def ann_form_for(record, options = {}, &block)
    options.merge!(builder: Ann::Helpers::FormBuilder)
    form_for record, options, &block
  end
end
