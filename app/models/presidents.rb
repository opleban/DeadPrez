require_relative '../../config/application'

class President < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :quotes
end