require 'rails_helper'
require "models/concerns/accountable_spec"

RSpec.describe Supplier, :type => :model do
  it_behaves_like "accountable"
end