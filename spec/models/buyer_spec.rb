require 'rails_helper'
require "models/concerns/accountable_spec"

RSpec.describe Buyer, :type => :model do
  it_behaves_like "accountable"

  subject {
    described_class.new(name: "Aleksa",
                        type: "Buyer",
                        description: 'pass',
                        address: 'ra@mail.com'
												)
  }

  it "is valid with valid data" do
  	expect(subject).to be_valid
	end
end