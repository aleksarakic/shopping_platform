shared_examples "accountable" do
  it { is_expected.to have_many(:users) }
end