class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user


  def forem_user
    current_player
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def current_question
		Question.last
	end
end
