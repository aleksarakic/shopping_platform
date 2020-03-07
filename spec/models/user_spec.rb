require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:accountable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:accountable_type).of_type(:string) }

  it { is_expected.to belong_to(:accountable) }

  let(:accountable) { Supplier.create(name: 'Aol', type: 'Supplier', description: '', address: '') }
  
  subject {
    described_class.new(first_name: "Aleksa",
                        last_name: "Rakic",
                        password: 'pass',
                        email: 'ra@mail.com',
                        :accountable => accountable,
												)
  }

  

  it "is valid with valid data" do
  	expect(subject).to be_valid
	end

  # before do
	 #  @user = User.new(first_name: "Aleksa", last_name: "Rakic", password: 'pass', email: 'ra@mail.com' )

  # end 

  # describe "user" do
    
  # end

  # supplier moze da ima produkte
  # buyer ne moze
end
