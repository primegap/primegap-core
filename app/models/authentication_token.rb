require 'has_secure_token'

class AuthenticationToken < ActiveRecord::Base
  include AuthenticationTokens::Associations

  has_secure_token :body
end
