class AuthenticationToken < ApplicationRecord
  include AuthenticationTokens::Associations

  has_secure_token :body
end
