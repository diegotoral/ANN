class UserPresenter < ApplicationPresenter
  def avatar
    @avatar ||= Gravatar::Avatar.new(model.email).url
  end
end
