class Subcriterion < ActiveRecord::Base
  attr_accessible :name ,:criterion_id , :description
   belongs_to :criterion
   has_many :company_subcriterions, :dependent => :delete_all

   validates_presence_of :name
     validates_uniqueness_of :name
end
