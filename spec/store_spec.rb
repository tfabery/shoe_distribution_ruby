require('spec_helper')

describe(Store, type: :model) do
  it { should have_many(:brands) }
  it { should have_many(:shoes) }
end
