require_relative '../../config/application'

class CreateCallLog < ActiveRecord::Migration
  def change
    create_table :call_logs do |t|
      t.belongs_to :president
      t.string :name
      t.integer :number

    end
  end
end