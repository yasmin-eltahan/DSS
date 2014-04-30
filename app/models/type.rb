class Type < ActiveRecord::Base
  attr_accessible :name, :technical , :description , :string
  has_many :requirements
end
