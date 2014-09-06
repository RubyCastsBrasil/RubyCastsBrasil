class User
  class Attributes
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def set_from_oauth(oauth)
      user.email    = oauth.info.email
      user
    end
  end
end
