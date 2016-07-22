require('spec_helper')

describe(Brand, type: :model) do
  it { should have_many(:stores) }
  it { should have_many(:shoes) }

  it "capitalizes the name regardless of how it was entered" do
    test_brand = Brand.create({name: 'hELlO'})
    expect(test_brand.name).to eq('Hello')
  end
end
