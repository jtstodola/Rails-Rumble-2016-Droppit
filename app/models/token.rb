class Token < ActiveRecord::Base
  belongs_to :user

  def self.create_or_update_for_user(user, service, auth_token)
    token = Token.where(service: service, user_id: user.id).first_or_initialize
    token.token = auth_token
    token.save
    token
  end
end
