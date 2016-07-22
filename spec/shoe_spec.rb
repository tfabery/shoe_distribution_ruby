require('spec_helper')

describe(Shoe, type: :model) do
  it { should belong_to(:brand) }
  it { should belong_to(:store) }
end
