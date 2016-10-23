class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_user_using_x_auth_token

  def create
    person = Person.find_for_database_authentication(email: params[:person] && params[:person][:email])
    if invalid_password?(person)
      respond_with_error "Incorrect email or password", 401
    else
      render  json: { auth_token: person.authentication_token }, location: root_path, status: :created
    end
  end

  private

  def invalid_password? person
    person.blank? || !person.valid_password?(params[:person][:password])
  end
end
