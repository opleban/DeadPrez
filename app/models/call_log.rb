require_relative '../../config/application'

class CallLog < ActiveRecord::Base
  belongs_to :president
end