module SpecLoginHelper

  # Public: logs the user in.
  # block - block for returning a user.
  def login user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

end