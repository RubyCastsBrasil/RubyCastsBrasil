# frozen_string_literal: true

class Authorization < ApplicationRecord
  belongs_to :user

  scope :find_from_oauth, -> (oauth) do
    where(:provider => oauth.provider, :uid => oauth.uid.to_s,
          :token => oauth.credentials.token,
          :secret => oauth.credentials.secret)
  end

  def self.github
    where(provider: 'github').first
  end

  def values
    @values ||= Attributes.new(self)
  end

  def associate
    @associate ||= Associate.new(self)
  end

  def set_attributes_from_oauth(oauth)
    values.set_from_oauth(oauth)
    self
  end

  def associate_user_from(oauth, user)
    associate.user_from(oauth, user)
    self
  end

  def self.find_or_initialize_by_oauth(auth, user)
    Oauth.find_or_initialize_by(auth, user)
  end
end
