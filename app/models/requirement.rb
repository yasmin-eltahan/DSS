class Requirement < ActiveRecord::Base
  attr_accessible :name, :technical , :description
  has_many :company_requirements
  has_many :systems, :through => :system_requirements
  has_many :system_requirements
  has_many :company_requirements
  has_many :companies, :through => :company_requirements

end
