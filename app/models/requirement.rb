class Requirement < ActiveRecord::Base
  attr_accessible :name, :technical , :description
  has_many :company_requirements
end
