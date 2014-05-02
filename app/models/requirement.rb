class Requirement < ActiveRecord::Base
  attr_accessible :name, :type_id ,:description
  has_many :company_requirements
  has_many :systems, :through => :system_requirements
  has_many :system_requirements
  has_many :company_requirements
  has_many :companies, :through => :company_requirements
<<<<<<< HEAD

=======
  belongs_to :type
>>>>>>> b6ef979080ccc19a9f436267541cfc10fd8511b3
end
