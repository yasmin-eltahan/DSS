class Subcriteria < ActiveRecord::Base
   attr_accessible :name ,:criteria_id , :description
   belongs_to :criteria
   has_many :company_subcriteria

end
