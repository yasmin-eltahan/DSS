class Company < ActiveRecord::Base
   attr_accessible :name, :address , :website , :headquarters , :size , :owner , :goals , :public , :no_of_employees , :no_of_braches , :revenue
     has_many :company_requirements
     has_many :company_criteria
     has_many :crtieria, :through => :company_criteria
     has_many :company_subcriteria
end
