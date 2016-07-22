require('spec_helper')

describe Store, type: :model do
  it { should have_many(:brands) }
  it { should have_many(:shoes) }
  it { should validate_presence_of(:name)}

  it "capitalizes the name regardless of how it was entered" do
    test_store = Store.create({name: 'hELlO'})
    expect(test_store.name).to eq('Hello')
  end
end
