class CompanySubcriterions < ActiveRecord::Base
 attr_accessible :company_id , :subcriterion_id
  belongs_to :company
  belongs_to :subcriterion
end
