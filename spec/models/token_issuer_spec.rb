require 'rails_helper'

RSpec.describe TokenIssuer, type: :model do
  let(:resource) do
    double(:resource, id: 1,
                      authentication_tokens: authentication_tokens)
  end
  let(:authentication_tokens) do
    double(:authentication_tokens, create!: authentication_token)
  end
  let(:authentication_token) do
    double(:authentication_token, body: 'token')
  end
  let(:request) do
    double(:request, remote_ip: '100.10.10.23',
                     user_agent: 'Test Browser',
                     headers: { 'X-Auth-Token' => 'token' })
  end

  describe '.create_and_return_token' do
    it 'creates a new token for the user' do
      expect(resource.authentication_tokens).to receive(:create!)
        .with(last_used_at: DateTime.current,
              ip_address: request.remote_ip,
              user_agent: request.user_agent)
        .and_return(authentication_token)
      described_class.create_and_return_token(resource, request)
    end

    it 'returns the token body' do
      allow(resource.authentication_tokens).to receive(:create!)
        .and_return(authentication_token)
      expect(described_class.create_and_return_token(resource, request)).to eq('token')
    end
  end

  describe '.expire_token' do
    it 'destroys the token from the resource authentication_tokens' do
      allow(resource.authentication_tokens).to receive(:detect).and_return(authentication_token)
      expect(authentication_token).to receive(:destroy)
      described_class.expire_token(resource, request)
    end
  end

  describe '.purge_old_tokens' do
    it "deletes all the user's tokens" do
      expect(resource.authentication_tokens).to receive_message_chain(:order, :offset, :destroy_all)
      described_class.purge_old_tokens(resource)
    end
  end

  describe '#find_token' do
    it 'detects a token between the resource authentication_tokens' do
      expect(resource.authentication_tokens).to receive(:detect).and_return(authentication_token)
      described_class.build.find_token(resource, 'token')
    end
  end
end
