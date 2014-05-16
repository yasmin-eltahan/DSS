class CompanySystem < ActiveRecord::Base
  attr_accessible :company_id , :system_id , :final_score , :user_id
  belongs_to :system
  belongs_to :company
end
