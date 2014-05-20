class Technical < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :system_technicals, :dependent => :destroy
  has_and_belongs_to_many :systems, :dependent => :destroy
end
