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

  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:type).of_type(:string) }
  it { is_expected.to have_db_column(:description).of_type(:string) }
  it { is_expected.to have_db_column(:address).of_type(:string) }

  describe "Validations" do
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a type" do
      subject.type = nil
      expect(subject).to_not be_valid
    end

    it "is not valid type different than Buyer" do
      subject.type = 'Supplier'
      expect(subject).to_not be_valid
    end

    it "is not valid without an address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it "is valid with valid data" do
    	expect(subject).to be_valid
  	end
  end
end
