class AddAuthenticationTokenToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :authentication_token, :string
  end
end
