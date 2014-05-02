class Company < ActiveRecord::Base
   attr_accessible :name, :address , :website , :headquarters , :size , :owner , :goals , :public , :phone, :no_of_employees , :no_of_branches , :revenue
     has_many :company_requirements
     has_many :requirements , :through => :company_requirements
     has_many :company_criteria
     has_many :company_systems
     has_many :crtieria, :through => :company_criteria
     has_many :company_subcriteria

end
