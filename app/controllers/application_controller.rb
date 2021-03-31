class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home

  end

  private

    def redirect_if_not_logged_in
      if !current_user
        redirect_to '/'
      end
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

end
