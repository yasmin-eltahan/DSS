class Vendor < ActiveRecord::Base
   attr_accessible :name, :address , :consultant, :image,  :website , :revenue , :public , :no_of_employees , :headquarters , :phone , :description
   has_many :systems
   has_many :ranks
   mount_uploader :image, ImageUploader

   def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all , :order=>("name ASC"))
  end
end
 
end
