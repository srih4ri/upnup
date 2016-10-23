require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Auth Token is generated" do
    p = Person.new(email: 'srih4ri@gmail.com',
                   password: 'welcome')
    p.save
    assert p.reload.authentication_token.present?
  end
end
