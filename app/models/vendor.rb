class Vendor < ActiveRecord::Base
   attr_accessible :name, :address , :website , :revenue , :public , :no_of_employees , :headquarters , :phone , :description
   has_many :systems
   has_many :ranks
end
