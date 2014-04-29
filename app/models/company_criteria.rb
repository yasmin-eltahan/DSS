class CompanyCriteria < ActiveRecord::Base
   attr_accessible :company_id, :criteria_id , :system_id , :weight , :value
   belongs_to :company
   belongs_to :criteria
   belongs_to :system
end
