require 'rails_helper'
require "models/concerns/accountable_spec"

RSpec.describe Supplier, :type => :model do
  it_behaves_like "accountable"

  let(:product) {Product.create(supplier_id: 1)}
  subject {
    described_class.create(name: "Aleksa",
	                        type: "Supplier",
	                        description: 'pass',
	                        address: 'ra@mail.com',
	                        product_ids: [product.id] 
													)
  }

  # let(:user) {User.create(first_name: "Aleksa",
	 #                        last_name: "Rakic",
	 #                        password: 'pass',
	 #                        email: 'ra@mail.com',
	 #                        :accountable => subject,
	 # 											)}

  it "is valid with valid data" do
  	expect(subject).to be_valid
	end
end