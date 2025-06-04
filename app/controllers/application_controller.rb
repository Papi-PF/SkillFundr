class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def user_params
    params.require(:user).permit(:email, :password, :name, :role, :learning_style)
  end
end
