module Users
  module Associations
    extend ActiveSupport::Concern

    included do
      belongs_to :company
      has_many :authentication_tokens
    end
  end
end
