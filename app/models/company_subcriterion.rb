class CompanySubcriterion < ActiveRecord::Base
 attr_accessible :company_id , :subcriterion_id, :weight
  belongs_to :company
  belongs_to :subcriterion

  validates_presence_of :weight
   validates_numericality_of :weight
end
