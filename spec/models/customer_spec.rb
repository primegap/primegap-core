require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:full_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
  end

  describe '#split_full_name' do
    contex 'with first_name' do
      let(:subject) { Customer.create(full_name: 'John') }

      it { expect(subject.first_name).to eq 'John' }
      it { expect(subject.last_name).to be_nil }
    end

    context 'with first_name and last_name' do
      let(:subject) { Customer.create(full_name: 'John Doe') }

      it { expect(subject.first_name).to eq 'John' }
      it { expect(subject.last_name).to eq 'Doe' }
    end

    context 'with first_name, middle_name and last_name' do
      let(:subject) { Customer.create(full_name: 'John F. Doe') }

      it { expect(subject.first_name).to eq 'John F.' }
      it { expect(subject.last_name).to eq 'Doe' }
    end
  end
end
