require('spec_helper')

describe(Shoe, type: :model) do
  it { should belong_to(:brand) }
  it { should belong_to(:store) }

  it "capitalizes the name regardless of how it was entered" do
    test_shoe = Shoe.create({name: 'hELlO'})
    expect(test_shoe.name).to eq('Hello')
  end
end
