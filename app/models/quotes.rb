require_relative '../../config/application'

class Quote < ActiveRecord::Base
  belongs_to :president
end