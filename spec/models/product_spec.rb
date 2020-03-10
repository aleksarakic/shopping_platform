require 'rails_helper'

RSpec.describe Product, type: :model do

	describe 'DB attributes' do
	  it { is_expected.to have_db_column(:name).of_type(:string) }
	  it { is_expected.to have_db_column(:description).of_type(:string) }
	  it { is_expected.to have_db_column(:price).of_type(:integer) }
	  it { is_expected.to have_db_column(:quantity).of_type(:integer) }
	  it { is_expected.to have_db_column(:category).of_type(:string) }
	end

	describe 'Associations' do
  	it { is_expected.to belong_to(:supplier) }
  end

  let(:supplier) { Supplier.create(name: 'Aol', type: 'Supplier', description: '', address: '') }

  subject {
    described_class.new(name: "Aleksa",
                        description: 'Desc',
                        price: 12,
                        quantity: 21,
                        category: 'B',
                        supplier: supplier
                        )
    }

  describe "Validations" do
    it "is valid with valid data" do
    	expect(subject).to be_valid
  	end
  	
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an either A or B or C or D category" do
      subject.category = 'K'
      expect(subject).to_not be_valid
    end
  end

  describe ".sort" do
    it 'should accept hash as param' do
      param = {id: 1, search_param: 'name'}
      results = Product.sort(param)
      expect(results).not_to be_empty
    end

    it 'should sort products by categoory in ASC order' do
      param = {id: 1, search_param: 'category'}
      results = Product.sort(param).map(&:name)
      expect(results).to eql(['Health & Fitness', 'Business', 'Music'])
    end

    it 'should sort products by name in ASC order' do
      param = {id: 1, search_param: 'name'}
      results = Product.sort(param).map(&:name)
      expect(results).to eql(['Business', 'Health & Fitness', 'Music'])
    end
  end
end
