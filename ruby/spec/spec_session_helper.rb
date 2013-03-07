module SpecSessionHelper  

  def valid_session
    {}
  end

  def valid_attributes
    { "email" => "gontoq@gonto.com", "password" => "1234567" }
  end

  def valid_facebook_attributes 
    {"facebook_token" => "BAABxOZCc0HksBAAUIAeT6mXe5O7gFZCaWljwM9qXAxTiZB9DFUXp0Tneh98yZAWcYOW8sj5x3X0LU4HSECLAyghJcPKT35H1hZAYO23hfuh9rGmQuULBG"}
  end

  def invalid_facebook_attributes 
    {"facebook_token" => "422"}
  end

  def invalid_attributes
    { "email" => "gontoq", "password" => "1234567" }
  end

end
