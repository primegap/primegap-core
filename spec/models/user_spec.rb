require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:company_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:authentication_tokens) }
  end

  describe 'has secure password' do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password) }

    it { expect(User.new(email: 'user@email.com', password: nil).save).to be_falsey }
    it { expect(User.new(email: 'user@email.com', password: 'foo').save).to be_falsey }
    it { expect(User.new(email: 'user@email.com', password: 'af3714ff0ffae').save).to be_truthy }
  end
end
