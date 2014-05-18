class CompanyCriterion < ActiveRecord::Base
 attr_accessible :company_id, :criterion_id , :system_id , :weight , :value ,:user_id
   belongs_to :company
   belongs_to :criterion
   belongs_to :system

   
end
