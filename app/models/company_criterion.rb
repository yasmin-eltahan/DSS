class CompanyCriterion < ActiveRecord::Base
 attr_accessible :company_id, :criterion_id , :system_id , :weight , :value ,:user_id
   belongs_to :company
   belongs_to :criterion
   belongs_to :system

   validates_presence_of :weight, :value
   validates_numericality_of :weight
   validates_numericality_of :value, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1 , :message => "Number Should be between 0 and 1"
end
