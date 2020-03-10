require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:first_name).of_type(:string) }
  it { is_expected.to have_db_column(:last_name).of_type(:string) }
  it { is_expected.to have_db_column(:avatar).of_type(:string) }
  it { is_expected.to have_db_column(:password).of_type(:string) }
  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:accountable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:accountable_type).of_type(:string) }

  it { is_expected.to belong_to(:accountable) }

  let(:accountable) { Supplier.create(name: 'Aol', type: 'Supplier', description: '', address: '') }
  
  subject {
    described_class.new(first_name: "Aleksa",
                        last_name: "Rakic",
                        password: 'password',
                        email: 'ra@mail.com',
                        :accountable => accountable,
												)
  }

  describe "Validations" do
    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with invalid email format" do
      subject.email = 'invalid_format'
      expect(subject).to_not be_valid
    end

    it "is valid with valid email format" do
      subject.email = 'email@example.com'
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is valid with valid data" do
      expect(subject).to be_valid
    end
  end
end
