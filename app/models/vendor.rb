class Vendor < ActiveRecord::Base
   attr_accessible :name, :address , :consultant, :image,  :website , :revenue , :public , :no_of_employees , :headquarters , :phone , :description
   has_many :systems, :dependent => :destroy
   has_many :ranks, :dependent => :destroy
   mount_uploader :image, ImageUploader

    validates_presence_of :name, :address, :website , :headquarters, :phone
    validates_uniqueness_of :name

   def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all , :order=>("name ASC"))
  end
end
 
end
