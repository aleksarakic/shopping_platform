require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:description).of_type(:string) }
  it { is_expected.to have_db_column(:price).of_type(:string) }
  it { is_expected.to have_db_column(:quantity).of_type(:string) }
  it { is_expected.to have_db_column(:category).of_type(:string) }

  it { is_expected.to belong_to(:supplier) }
end
