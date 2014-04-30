class CompanyRequirement < ActiveRecord::Base
   attr_accessible :company_id, :requirement_id ,:value , :max
   belongs_to :company
   belongs_to :requirement

end
