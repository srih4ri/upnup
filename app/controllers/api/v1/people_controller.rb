class Api::V1::PeopleController <  Api::V1::BaseController

  skip_before_action :authenticate_user!, only: [:create]
  skip_before_action :authenticate_user_using_x_auth_token, only: [:create]

  def create
    @person = Person.new(person_params)
    if @person.save
      render json: @person
    else
      respond_with_error(@person.errors)
    end
  end

  private
  
  def person_params
    params.require(:person).permit(:email, :password)
  end

end
