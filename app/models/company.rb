class Company < ActiveRecord::Base
  include Companies::Associations
  include Companies::Validations
end
