class CompanyCriteria < ActiveRecord::Base
   attr_accessible :company_id, :criteria_id ,:weight
   belongs_to :company
   belongs_to :criteria
end
