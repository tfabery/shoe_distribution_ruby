require('spec_helper')

describe 'Store path', type: :feature do
  it "adds a store" do
    visit '/'
    fill_in 'new_store_name', with: 'test store'
    click_button 'Add a Store'
    expect(page).to have_content('Test store')
  end

  it "edits a store" do
    test_store = Store.create({name: 'store'})
    visit '/store/' + test_store.id.to_s
    fill_in 'store_name', with: 'sto'
    click_button 'Edit Store'
    expect(page).to have_content('Sto')
  end

  it "deletes a store" do
    test_store = Store.create({name: 'store'})
    visit '/store/' + test_store.id.to_s
    click_button 'Delete'
    expect(page).to have_content('There are no stores')
  end
end

describe 'Brand path', type: :feature do
  it "adds a brand" do
    visit '/'
    fill_in 'new_brand_name', with: 'nike'
    click_button 'Add a Brand'
    expect(page).to have_content('Nike')
  end

  it "edits a brand" do
    test_brand = Brand.create({name: 'nike'})
    visit '/brand/' + test_brand.id.to_s
    fill_in 'brand_name', with: 'adidas'
    click_button 'Edit Brand'
    expect(page).to have_content('Adidas')
  end

  it "deletes a brand" do
    test_brand = Brand.create({name: 'nike'})
    visit '/brand/' + test_brand.id.to_s
    click_button 'Delete'
    expect(page).to have_content('There are no brands')
  end
end

describe 'Shoe path', type: :feature do
  it "adds a shoe" do
    test_brand = Brand.create({name: 'nike'})
    test_store = Store.create({name: 'store'})
    visit '/store/' + test_store.id.to_s
    fill_in 'new_shoe_name', with: 'free'
    select 'Nike', from: 'brand_id'
    click_button 'Add a Shoe'
    expect(page).to have_content('Free')
  end

  it "edits a shoe" do
    test_brand = Brand.create({name: 'nike'})
    test_store = Store.create({name: 'store'})
    test_shoe = Shoe.create({name: 'free', brand_id: test_brand.id, store_id: test_store.id})
    visit '/shoe/' + test_shoe.id.to_s
    fill_in 'shoe_name', with: 'adidas'
    click_button 'Edit Shoe'
    expect(page).to have_content('Adidas')
  end

  it "deletes a shoe" do
    test_brand = Brand.create({name: 'nike'})
    test_store = Store.create({name: 'store'})
    test_shoe = Shoe.create({name: 'free', brand_id: test_brand.id, store_id: test_store.id})
    visit '/shoe/' + test_shoe.id.to_s
    click_button 'Delete'
    expect(page).to have_content('There are no shoes')
  end
end
