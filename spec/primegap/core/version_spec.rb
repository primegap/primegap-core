require 'spec_helper.rb'
require 'primegap/core/version'

RSpec.describe Primegap::Core do
  describe 'VERSION' do
    it { expect(described_class.const_defined?(:VERSION)).to eq true }
    it { expect(described_class::VERSION).to be_kind_of(String) }
  end
end
