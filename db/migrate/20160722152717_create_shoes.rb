class CreateShoes < ActiveRecord::Migration
  def change
    create_table(:shoes) do |t|
      t.column(:name, :varchar)
      t.column(:brand_id, :int)
      t.column(:store_id, :int)
    end
  end
end
