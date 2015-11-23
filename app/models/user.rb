class User < ActiveRecord::Base
  include Users::Associations
  include Users::Validations

  has_secure_password
end
