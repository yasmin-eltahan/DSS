class Criterion < ActiveRecord::Base
  attr_accessible :name, :description
   has_many :company_criterions
   has_many :subcriterions
   has_many :companies, :through => :company_criterions
end
