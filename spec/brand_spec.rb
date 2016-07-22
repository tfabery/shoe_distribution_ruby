require('spec_helper')

describe(Brand, type: :model) do
  it { should have_many(:stores) }
  it { should have_many(:shoes) }
end
