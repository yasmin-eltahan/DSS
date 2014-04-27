class Vendor < ActiveRecord::Base
   attr_accessible :name, :address , :website , :revenue , :public , :no_of_employees , :headquarters
   has_many :systems
end
