class Criteria < ActiveRecord::Base
   attr_accessible :name, :description
   has_many :company_criteria
   has_many :companies, :through => :company_criteria
   has_many :subcriteria

end
