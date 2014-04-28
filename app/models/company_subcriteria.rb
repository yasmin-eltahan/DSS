class CompanySubcriteria < ActiveRecord::Base
  attr_accessible :company_id , :subcriteria_id
  belongs_to :company
  belongs_to :subcriteria
end
