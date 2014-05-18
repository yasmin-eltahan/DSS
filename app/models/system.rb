class System < ActiveRecord::Base
   attr_accessible :name, :programming_language, :description, :no_of_employees , :vendor_id
   has_many :system_technicals, :dependent => :destroy
   has_many :company_systems, :dependent => :destroy
   belongs_to :vendor
   has_many :versions, :dependent => :destroy
   has_many :reviews ,:dependent => :destroy
   has_many :company_criteria, :dependent => :destroy
   has_many :requirements, :through => :system_requirements
   has_many :system_requirements, :dependent => :destroy
   has_many :ranks, :dependent => :destroy

   validates_presence_of :name

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all , :order=>("name ASC"))
  end
end


end
