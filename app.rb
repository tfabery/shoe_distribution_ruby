require("bundler/setup")
require("pathname")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stores = Store.all
  @brands = Brand.all
  erb :index
end

get '/store/:store_id' do
  @store = Store.find params['store_id']
  @brands = Brand.all
  erb :store
end

get '/brand/:brand_id' do
  @brand = Brand.find params['brand_id']
  erb :brand
end

get '/shoe/:shoe_id' do
  @shoe = Shoe.find params['shoe_id']
  erb :shoe
end

get '/error/:item' do
  @item = params['item'].capitalize
  erb :error
end

post '/add_store' do
  store = Store.create({name: params['new_store_name']})
  if store.id
    redirect '/store/' + store.id.to_s
  else
    redirect '/error/store'
  end
end

post '/add_brand' do
  brand = Brand.create({name: params['new_brand_name']})
  if brand.id
    redirect '/brand/' + brand.id.to_s
  else
    redirect '/error/brand'
  end
end

post '/add_shoe' do
  shoe = Shoe.create({name: params['new_shoe_name'], brand_id: params['brand_id'], store_id: params['store_id']})
  if shoe.id
    redirect '/shoe/' + shoe.id.to_s
  else
    redirect '/error/shoe'
  end
end

patch '/store/edit' do
  store = Store.find params['store_id'].to_i
  store.update({name: params['store_name']})
  redirect '/store/' + params['store_id']
end

patch '/brand/edit' do
  brand = Brand.find params['brand_id'].to_i
  brand.update({name: params['brand_name']})
  redirect '/brand/' + params['brand_id']
end

patch '/shoe/edit' do
  shoe = Shoe.find params['shoe_id'].to_i
  shoe.update({name: params['shoe_name']})
  redirect '/shoe/' + params['shoe_id']
end

delete '/store/delete' do
  store = Store.find(params['store_id'])
  store.destroy
  redirect '/'
end

delete '/brand/delete' do
  brand = Brand.find(params['brand_id'])
  brand.destroy
  redirect '/'
end

delete '/shoe/delete' do
  shoe = Shoe.find(params['shoe_id'])
  shoe.destroy
  redirect '/store/' + shoe.store_id.to_s
end
