class Subcriterion < ActiveRecord::Base
  attr_accessible :name ,:criterion_id , :description
   belongs_to :criterion
   has_many :company_subcriterions
end
