class WelcomeController < LandingController
  def index
    @user = User.new
  end
end
