require 'rails_helper'
require "models/concerns/accountable_spec"

RSpec.describe Buyer, :type => :model do
  it_behaves_like "accountable"
end