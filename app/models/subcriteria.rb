class Subcriteria < ActiveRecord::Base
   attr_accessible :name ,:criterion_id , :description
   belongs_to :criteria
   has_many :company_subcriteria

end
