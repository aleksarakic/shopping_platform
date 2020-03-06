require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:accountable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:accountable_type).of_type(:string) }

  it { is_expected.to belong_to(:accountable) }
end
