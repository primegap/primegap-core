module Users
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :password, length: { minimum: 8 }
    end
  end
end
