module Users
  module Validations
    extend ActiveSupport::Concern

    included do
      validates_presence_of :email
      validates :password, length: { minimum: 8 }
    end
  end
end
