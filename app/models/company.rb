class Company < ActiveRecord::Base
   attr_accessible :name, :address , :show , :image , :confirm , :website , :headquarters , :size , :owner , :goals , :public , :phone, :no_of_employees , :no_of_branches , :revenue
     has_many :company_requirements, :dependent => :destroy
     has_many :requirements , :through => :company_requirement
     has_many :company_criterions, :dependent => :destroy
     has_many :company_systems, :dependent => :destroy
     has_many :crtierions, :through => :company_criterion
     has_many :company_subcriterions, :dependent => :destroy
	 has_many :company_users, :dependent => :destroy
     has_many :users , :through => :company_user
     mount_uploader :image, ImageUploader
     accepts_nested_attributes_for :company_users , allow_destroy: true

     validates_presence_of :name, :address, :website , :headquarters, :phone
     validates_uniqueness_of :name
    
	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	   # find(:all , :conditions => {:confirm => true} , :order=>("name ASC"))
	       find(:all , :order=>("name ASC"))
	  end
	end

end
