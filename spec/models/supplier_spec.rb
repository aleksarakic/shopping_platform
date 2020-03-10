require 'rails_helper'
require "models/concerns/accountable_spec"

RSpec.describe Supplier, :type => :model do
  it_behaves_like "accountable"

  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:type).of_type(:string) }
  it { is_expected.to have_db_column(:description).of_type(:string) }
  it { is_expected.to have_db_column(:address).of_type(:string) }


  let(:product) {Product.create(supplier_id: 1)}
  subject {
    described_class.create(name: "Aleksa",
	                        type: "Supplier",
	                        description: 'pass',
	                        address: 'ra@mail.com',
	                        product_ids: [product.id] 
													)
  }

  describe "Associations" do
    it { should have_many(:products) }
  end

	describe "Validations" do
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a type" do
      subject.type = nil
      expect(subject).to_not be_valid
    end

    it "is not valid type different than Supplier" do
      subject.type = 'Buyer'
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

  describe ".search" do
    it 'successfully finds a record' do
      param = 'SupplierA'
      results = Supplier.search(param).map(&:name)
      expect(results).to eql(['SupplierA'])
    end

    it 'should return all objects when argument is nil' do
      param = nil
      results = Supplier.search(param)
      expect(results.count).to eql(Supplier.all.count)
    end
  end
end