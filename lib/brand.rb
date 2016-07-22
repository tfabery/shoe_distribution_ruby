class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes
  before_save :capitalize
  validates :name, presence: true

  private
    define_method :capitalize do
      self.name = name.capitalize
    end
end
