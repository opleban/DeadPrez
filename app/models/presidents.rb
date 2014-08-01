require_relative '../../config/application'

class President < ActiveRecord::Base
  has_many :quotes
end