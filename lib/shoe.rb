class Shoe < ActiveRecord::Base
  belongs_to :brand
  belongs_to :store
  before_save :capitalize

  private
    define_method :capitalize do
      self.name = name.capitalize
    end
end
