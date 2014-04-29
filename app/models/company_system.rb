class CompanySystem < ActiveRecord::Base
  attr_accessible :company_id , :system_id , :final_score
  belongs_to :system
  belongs_to :company
end
