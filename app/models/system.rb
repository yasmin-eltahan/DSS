class System < ActiveRecord::Base
   attr_accessible :name, :programming_language, :description, :no_of_employees , :vendor_id
   has_many :system_technicals
   has_many :company_systems
   belongs_to :vendor
   has_many :versions
   has_many :reviews ,:dependent => :destroy
   has_many :company_criteria
   has_many :requirements, :through => :system_requirements
   has_many :system_requirements
   has_many :ranks

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all , :order=>("name ASC"))
  end
end


end
