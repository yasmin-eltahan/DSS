class Type < ActiveRecord::Base
  attr_accessible :name, :technical , :description , :string , :requirements_attributes
  has_many :requirements
  accepts_nested_attributes_for :requirements
end
